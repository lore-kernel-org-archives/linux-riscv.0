Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805EFC4829D
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 06:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41WbWy56qoz8AT9a2MkqQnpnibv2RKF+eKZr6gFp3ws=; b=ZxTkm3J6IOAjE7
	3YIfYBFk7TqDEa1P6xzrr8RaJrs8sHwxlnZ2GseoXWGIhJa/TF+Cv34rjnlc2dfZ1P5321ryopWzk
	+wY2igDa+8WzLsTSvr8vudtdQ+QEcyh1tl+Xjd2YT6JN8W+CxkVKL8MpGi0WMlz5t0QmLPx22DjSa
	CtNv3FBH+tx/YNZfsBYKt7NcX44oYqzKBIgZICngtcqKiF1OzepWtE11CDBuLm2lKQthEn63Ix0pS
	u8Qu8HaEZAM3h2nKy0LX9OQ07B/ZYfxXPMwLP8uHes0qkINuXvmCo+EiVWE3Fcc4qMfkwe6icjQ3E
	c+ityXuKMjEWSmCMkPVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZV-0000000GFsp-41I3;
	Fri, 09 Feb 2024 06:41:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZR-0000000GFn0-3kFf
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 06:41:11 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a389a3b9601so76826466b.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 22:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1707460866; x=1708065666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/ygjtZTVjHU12+LM3KMSNgL31cpnfsr1+pYQSNIAAg=;
        b=Shaq7AgjX4SwmTDQM1CubeVd+AfmEmPVhpcTTiPy0ChHOF9ZTRVIHuZVWeiXa7KeGp
         hs4EohrVXmquLv3Ud3R3S6I1evbkAGNpjSQyjpl5Zs522B6koB5eWRN2knvrfZSADykZ
         xBbNA9Bc/z53bOC5Z+QtHljDV0K9JEvdLP/oWJlHvX/o2czK2dVPpbmONxPimfv5v9ja
         3ixBYpyEnoAOI1h8esOmq1I0eO6pXqABNH6cMtNLDyNO7ZlK4Dbq8A250XxH2f7cHUos
         KjT08pJzjE8IsL1E/HNs6bqNt9/ykatjAQ9/5zGmrDodEr0v9O1A8ET0k5mL1AA9JxWF
         wonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707460866; x=1708065666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/ygjtZTVjHU12+LM3KMSNgL31cpnfsr1+pYQSNIAAg=;
        b=lorvI1r2chIie9FfYyb6P6bEF0YWExUFqcqhCXfe3Uxm79vTEWbbqK4rMaXYr7Jqrl
         KgDf0Xp687T8jkzvd5dplncAKmb83sSgnsR8tktQ0diqzSiY6QwSD4t2yIW44zk8QLuk
         VXvIvDBHvneD211mEz9Amd5407ZygJNViBdOBpOxZJD3/Hb0Dl9TJH6D/+415GjzkRBW
         KrbkVq7r6UX2GyFtya8udK8J0+M9GbaLHarj+Zad15Es7RCY0t39BDixgo9qiK3utcOv
         uvCahbwHVwRdWAzsnySW59eAksoJTOsW0qhfzn/rlR27uECeVKMpGNDaoyqHh/BU+40r
         fcQA==
X-Gm-Message-State: AOJu0YzRtV4x0EusUF9K1CbpQqSvNlSAJquLSjPQkAYeQ0rWhe+DDk3c
	KoYkzqWdl6pJ8zR2ZoNO3m1Ew3P0C7EUzgQO6BT/Z/AyK1htVpq19HRGmIZhfz4ioCl9GYl+OqV
	u/ok=
X-Google-Smtp-Source: AGHT+IEIwRiGBGnLEqNZprft3iYD6FyLivJVlJ5DvcYSMjlUi+u/u4Zmw+cdsozGJ8bDIbGbqO9viw==
X-Received: by 2002:a17:907:363:b0:a3b:e115:7b69 with SMTP id rs3-20020a170907036300b00a3be1157b69mr404470ejb.69.1707460866164;
        Thu, 08 Feb 2024 22:41:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVssZFqFbfzrmw5N+m8jAa5zM7KTVmwqDhtj5haZxxQzg6uOIC2be48nkwLf0iu0niHguJ551L7u5EteLMF9srBcTAPbhPmlhN9lnjkUU2tTUIeTzif6I3w0++uwCEmChFy3wD+RbH1zBIgET/4eJv8GvYZpGHrClhravWVN/9G12TzOT6pSxV2Hf5e3nv7flcEKay3n/VtUfCFZG3bPN9ruH01WA4pLxi6TRTHdY1GWH33+HGoG4MpOKRjax3mVebVc09T8VWGX+znRRJccUOB6llHqPneJV3KtYH+dT4o/DHN4NIJfia2h3/sHl4L3kSb/tSovFkIYLWSDk7SfUqW4Chj3MUJXUmE0sf9MQYAdtfAN6/1fja+8Igov9hgoncDu7N6JrTf1HelAqwly0GYbt9mqEuV8OdU8VwuMxP9M/G6jFA4wa/KHnI64loSqYdktUMjvLgZ7rx2qlfJXN6Zd3aOJyvy7H5eCPyX4h6MwZ4bSZg8NP1kggYVgQlsNU1N6PAwAccqf+KBuVmusiVRDgI+H0kqOURQEVwFR6RGGBHW+HSr7CQwAxFTrLx054movAmNnanQ2a79ApvJwsN3r/dgbUoFqDGx06ftfb/L8PW2DBt5m8p9uCyAVppafDCV6fPkCjNoRaVSmiVJ3sH76fTIAlBb876kIN/CSV8gNL/Ffh4rtqvRfEz6leUCCjBpy0vXgkAx4sCA7iptzDDd8TasbVhCvk8WJkPDXMHVafgfSo/lKt24X5klr1yI0qYMQawiJ5TkcuJOiLbzBMsWBu8vz6ANKnF7FSpPfnOyRduMkg26SjeQOmb1c/q857B+B6Y2Rw1lUEIifHLy+pGHEaQaYYnqCNjq+3DZmZd6g==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id vb9-20020a170907d04900b00a370a76d3a0sm441180ejc.123.2024.02.08.22.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:41:05 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Brendan Sweeney <turtwig@utexas.edu>,
	Andrew Waterman <andrew@sifive.com>,
	Brendan Sweeney <brs@berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Hans Boehm <hboehm@google.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v2 6/6] RISC-V: selftests: Add DTSO tests
Date: Fri,  9 Feb 2024 07:40:50 +0100
Message-ID: <20240209064050.2746540-7-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
References: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_224110_048832_47B5ECE6 
X-CRM114-Status: GOOD (  21.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCB0ZXN0cyB0aGUgZHluYW1pYyBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwgcHJj
dGwoKSBiZWhhdmlvdXIKb24gUklTQy1WLiBJdCBkb2VzIG5vdCBkZXBlbmQgb24gQ09ORklHX1JJ
U0NWX0lTQV9TU0RUU08gb3IgdGhlIGF2YWlsYWJpbGl0eQpvZiBTc2R0c28sIGJ1dCB3aWxsIHRl
c3Qgb3RoZXIgYXNwZWN0cyBpZiB0aGVzZSBhcmUgbm90IGdpdmVuLgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Ci0tLQogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvTWFrZWZpbGUgICAgICAgIHwgIDIgKy0KIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2R0c28vLmdpdGlnbm9yZSB8ICAxICsKIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2R0c28vTWFrZWZpbGUgICB8IDExICsrKwogdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby9kdHNvLmMgICAgIHwgODIgKysrKysrKysrKysrKysr
KysrKwogNCBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby8uZ2l0
aWdub3JlCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
ZHRzby9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L2R0c28vZHRzby5jCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9NYWtlZmlsZQpp
bmRleCA0YTlmZjUxNWEzYTAuLjE0MjFjMjE4NDFmOSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmlzY3YvTWFrZWZpbGUKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvTWFrZWZpbGUKQEAgLTUsNyArNSw3IEBACiBBUkNIID89ICQoc2hlbGwgdW5hbWUgLW0g
Mj4vZGV2L251bGwgfHwgZWNobyBub3QpCiAKIGlmbmVxICgsJChmaWx0ZXIgJChBUkNIKSxyaXNj
dikpCi1SSVNDVl9TVUJUQVJHRVRTID89IGh3cHJvYmUgdmVjdG9yIG1tCitSSVNDVl9TVUJUQVJH
RVRTID89IGR0c28gaHdwcm9iZSB2ZWN0b3IgbW0KIGVsc2UKIFJJU0NWX1NVQlRBUkdFVFMgOj0K
IGVuZGlmCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9kdHNvLy5n
aXRpZ25vcmUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9kdHNvLy5naXRpZ25vcmUK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yMTdkMDE2NzkxMTUKLS0t
IC9kZXYvbnVsbAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9kdHNvLy5naXRp
Z25vcmUKQEAgLTAsMCArMSBAQAorZHRzbwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcmlzY3YvZHRzby9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L2R0c28vTWFrZWZpbGUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5h
MWZmYmRkM2RhODUKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9y
aXNjdi9kdHNvL01ha2VmaWxlCkBAIC0wLDAgKzEsMTEgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKKyMgQ29weXJpZ2h0IChDKSAyMDIzIFZSVUxMCisKK0NGTEFHUyArPSAt
SSQodG9wX3NyY2RpcikvdG9vbHMvaW5jbHVkZQorCitURVNUX0dFTl9QUk9HUyA6PSBkdHNvCisK
K2luY2x1ZGUgLi4vLi4vbGliLm1rCisKKyQoT1VUUFVUKS9kdHNvOiBkdHNvLmMgLi4vaHdwcm9i
ZS9zeXNfaHdwcm9iZS5TCisJJChDQykgLXN0YXRpYyAtbyRAICQoQ0ZMQUdTKSAkKExERkxBR1Mp
ICReCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9kdHNvL2R0c28u
YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2R0c28vZHRzby5jCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYzhhN2IyNWFkZWZkCi0tLSAvZGV2L251bGwK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvZHRzby9kdHNvLmMKQEAgLTAsMCAr
MSw4MiBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQorLyogZHRz
byAtIHVzZWQgZm9yIGZ1bmN0aW9uYWwgdGVzdHMgb2YgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVs
IHN3aXRjaGluZworICogYXQgcnVuLXRpbWUuCisgKgorICogQ29weXJpZ2h0IChjKSAyMDIzIENo
cmlzdG9waCBNdWVsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PgorICovCisKKyNp
bmNsdWRlIDxzeXMvcHJjdGwuaD4KKyNpbmNsdWRlIDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxlcnJu
by5oPgorCisjaW5jbHVkZSAiLi4vaHdwcm9iZS9od3Byb2JlLmgiCisjaW5jbHVkZSAiLi4vLi4v
a3NlbGZ0ZXN0X2hhcm5lc3MuaCIKKworLyoKKyAqIFdlIGhhdmUgdGhlIGZvbGxvd2luZyBjYXNl
czoKKyAqIDEpIERUU08gc3VwcG9ydCBkaXNhYmVkIGluIHRoZSBrZXJuZWwgY29uZmlnOgorICog
ICAgLSBTc2R0c28gaXMgbm90IGRldGVjdGVkCisgKiAgICAtIHtHLFN9RVRfTUVNT1JZX0NPTlNJ
U1RFTkNZX01PREVMIGZhaWxzIHdpdGggRUlOVkFMCisgKiAyKSBEVFNPIHN1cHBvcnQgZW5hYmxl
ZCBhbmQgU3NkdHNvIG5vdCBhdmFpbGFibGU6CisgKiAgICAtIFNzZHRzbyBpcyBub3QgZGV0ZWN0
ZWQKKyAqICAgIC0ge0csU31FVF9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUwgd29ya3MgZm9yIFdN
TyBhbmQgZmFpbHMgZm9yIFRTTyB3aXRoIEVJTlZBTDoKKyAqIDMpIERUU08gc3VwcG9ydCBlbmFi
bGVkIGFuZCBTc2R0c28gYXZhaWxhYmxlCisgKiAgICAtIFNzZHRzbyBpcyBkZXRlY3RlZAorICog
ICAgLSB7RyxTfUVUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCB3b3JrcyBmb3IgV01PIGFuZCBU
U08KKyAqLworCitURVNUKGR0c28pCit7CisJc3RydWN0IHJpc2N2X2h3cHJvYmUgcGFpcjsKKwlp
bnQgcmV0OworCWJvb2wgc3NkdHNvX2NvbmZpZ3VyZWQ7CisJYm9vbCBzc2R0c29fYXZhaWxhYmxl
OworCisJcmV0ID0gcHJjdGwoUFJfR0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCk7CisJaWYg
KHJldCA8IDApIHsKKwkJQVNTRVJUX0VRKGVycm5vLCBFSU5WQUwpOworCQlzc2R0c29fY29uZmln
dXJlZCA9IGZhbHNlOworCX0gZWxzZSB7CisJCUFTU0VSVF9UUlVFKHJldCA9PSBQUl9NRU1PUllf
Q09OU0lTVEVOQ1lfTU9ERUxfUklTQ1ZfV01PIHx8CisJCQkgICAgcmV0ID09IFBSX01FTU9SWV9D
T05TSVNURU5DWV9NT0RFTF9SSVNDVl9UU08pOworCQlzc2R0c29fY29uZmlndXJlZCA9IHRydWU7
CisJfQorCisJcGFpci5rZXkgPSBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzA7CisJcmV0ID0g
cmlzY3ZfaHdwcm9iZSgmcGFpciwgMSwgMCwgTlVMTCwgMCk7CisJQVNTRVJUX0dFKHJldCwgMCk7
CisJQVNTRVJUX0VRKHBhaXIua2V5LCBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzApOworCXNz
ZHRzb19hdmFpbGFibGUgPSAhIShwYWlyLnZhbHVlICYgUklTQ1ZfSFdQUk9CRV9FWFRfU1NEVFNP
KTsKKworCWlmIChzc2R0c29fY29uZmlndXJlZCkgeworCQkvKiBSZWFkIG91dCBjdXJyZW50IG1v
ZGVsLiAqLworCQlyZXQgPSBwcmN0bChQUl9HRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMKTsK
KwkJQVNTRVJUX1RSVUUocmV0ID09IFBSX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTF9SSVNDVl9X
TU8gfHwKKwkJCSAgICByZXQgPT0gUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1RT
Tyk7CisKKwkJaWYgKHNzZHRzb19hdmFpbGFibGUpIHsKKwkJCS8qIFN3aXRjaCB0byBUU08uICov
CisJCQlyZXQgPSBwcmN0bChQUl9TRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMLAorCQkJCSAg
ICBQUl9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUxfUklTQ1ZfVFNPKTsKKwkJCUFTU0VSVF9FUShy
ZXQsIDApOworCQkJcmV0ID0gcHJjdGwoUFJfR0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCk7
CisJCQlBU1NFUlRfVFJVRShyZXQgPT0gUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NW
X1RTTyk7CisKKwkJCS8qIFRyeSBzd2l0Y2hpbmcgYmFjayB0byBXTU8gKG11c3QgZmFpbCkuICov
CisJCQlyZXQgPSBwcmN0bChQUl9TRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMLAorCQkJCSAg
ICBQUl9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUxfUklTQ1ZfV01PKTsKKwkJCUFTU0VSVF9MVChy
ZXQsIDApOworCQkJcmV0ID0gcHJjdGwoUFJfR0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCk7
CisJCQlBU1NFUlRfVFJVRShyZXQgPT0gUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NW
X1RTTyk7CisJCX0gZWxzZSB7CisJCQkvKiBTZXQgdGhlIHNhbWUgbW9kZWwsIHRoYXQncyBjdXJy
ZW50bHkgYWN0aXZlLiAqLworCQkJcmV0ID0gcHJjdGwoUFJfU0VUX01FTU9SWV9DT05TSVNURU5D
WV9NT0RFTCwgcmV0KTsKKwkJCUFTU0VSVF9FUShyZXQsIDApOworCQl9CisJfSBlbHNlIHsKKwkJ
QVNTRVJUX0VRKHNzZHRzb19hdmFpbGFibGUsIGZhbHNlKTsKKwkJa3NmdF90ZXN0X3Jlc3VsdF9z
a2lwKCJTc2R0c28gbm90IGNvbmZpZ3VyZWRcbiIpOworCX0KK30KKworVEVTVF9IQVJORVNTX01B
SU4KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
