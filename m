Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D7DCD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=62pvZGW11wyefAYb6ScL0VCIax8hJFHBJdu64hwOoSs=; b=17kFP8GQPVk3tI
	HCV3outXdodI93BKoevhwH0IVu3wqNlxtVT+sj1NEbsByVHw/bOvel0Io+THrGxRQANHTB1rEHW1I
	9JiypemXBGmM/Mzi2wyvGGyYEe+azCQ5vCJrgSP07bqPbLxTzjB8cf+XLyOZ2KiGx4TKpUUlX6HmJ
	QVwpHAvnKtezzoinWcV/2R0oyr/YPdib8ssz1W1m0/jzFhK0VZAiXve93aM0RORDRSucX+J1ll1Vp
	g+WlXDPy92nTLS7YWqozHVRbiQIGT9Ga9q3Cmg4q99bjx/Pb06HmbH5AXPq9Wg7qKFdvw0pyaPzgk
	XY92Ies7gDPsLxDcE1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqB7n-00000000I2I-1yCw;
	Fri, 29 Mar 2024 12:14:23 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqB7k-00000000I1N-32ep
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 12:14:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a4e39f5030dso45765566b.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711714458; x=1712319258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OO1k6uOo9XO4/TXWsGym98But5cvRnet8GLuLLdO1bA=;
        b=YRwy0vt8vk80r2TUyhmqQlprEt2MOiHmxl+KpxCVoUgFtnYW3Dn0lO+Q0Se0wBkER9
         n8PnBSqjlLdZqgisZ91uG6/8mWb1JMTElOI8d07fmYXgKE7/aAXVUgKM9ARkHjTw86qH
         M+qX5byUGqIPIMip/4pgfb74MymULp58JbdUjkXRNrvQVsu8TMw9yX9Sg/sQQi0cbdbi
         D+U7Loa//p8jOmfMaxAyG8tnaPfFIn4GAQvh3ZJUszOGdBFlqbF5G1nHTl3fOQg2YYKH
         ah68emJD2RnexIJWaf8J7gDYoGx2B/7XBtseJdQ0WqaA/0+QMhmTu2V8Zqt3eIenKIrU
         unVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711714458; x=1712319258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OO1k6uOo9XO4/TXWsGym98But5cvRnet8GLuLLdO1bA=;
        b=YjCZyKT0TfkfYVaRDBRfLzhtAHGeZkQwmsfD0FkK/+D8RYruHf6YKksRFU+49EAlTS
         tAZdduhbz5sbxOyr9w0vfxteCs/P7xwJ/i9XHEgtF74L1U1J1MdHEH/eaRQYl5lYM4Om
         eTlAG50sObSl4aAdZoxwduObOsN6S98s6QKxJXlbpFbeU7I8vNqFnIP43SNicPMEnT/v
         ZGZH2ztPrkaguwZa1ZNr3oQdEX+Zy6hWToIMwBGK25DRTyLWHgURIHi2LQ5Rero/Bnul
         6KSAIerLpTC7X/Fl4v/+Kh2QjpF9zw5KnYCXbHqBwnpwfNXW7XgXpjprqUDS9G24/Pww
         SffA==
X-Gm-Message-State: AOJu0YyYYkwsYh1v48GoUylmaspOKChuogfKso5CmZhykfzvuTEfZh3t
	3YbvEgN1MCIzhK+05b1/CsUdTDyR/BDovnOAWP9kdN1BuZ/HqTD+3zU4PviCRsE7TPv2va/gL68
	+u/E=
X-Google-Smtp-Source: AGHT+IH9fWrgL09gu878bMaJvlMckx22/uvLhk+HizZG/nZ6JnFE48PaEKy3+j21KwsT+VDdHsQ0pQ==
X-Received: by 2002:a17:906:a459:b0:a4e:def:ffc3 with SMTP id cb25-20020a170906a45900b00a4e0defffc3mr1574068ejb.5.1711714458218;
        Fri, 29 Mar 2024 05:14:18 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906539000b00a46dd1f7dc1sm1869942ejo.92.2024.03.29.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 05:14:17 -0700 (PDT)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 0/2] RISC-V: Test th.sxstatus.MAEE bit before enabling MAEE
Date: Fri, 29 Mar 2024 13:14:12 +0100
Message-ID: <20240329121414.688391-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_051420_857601_24AAF391 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Q3VycmVudGx5LCB0aGUgTGludXgga2VybmVsIHN1ZmZlcnMgZnJvbSBhIGJvb3QgcmVncmVzc2lv
biB3aGVuIHJ1bm5pbmcKb24gdGhlIGM5MDYgUUVNVSBlbXVsYXRpb24uIERldGFpbHMgaGF2ZSBi
ZWVuIHJlcG9ydGVkIGhlcmUgYnkgQmrDtnJuIFTDtnBlbDoKICBodHRwczovL2xpc3RzLmdudS5v
cmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyNC0wMS9tc2cwNDc2Ni5odG1sCgpUaGUgbWFp
biBpc3N1ZSBpcywgdGhhdCBMaW51eCBlbmFibGVzIE1BRUUgZm9yIENQVXMgdGhhdCBoYXZlIGEg
VC1IZWFkCm12ZW5kb3JpZCBidXQgUUVNVSBtYWludGFpbmVycyBkb24ndCB3YW50IHRvIGVtdWxh
dGUgYSBDUFUgdGhhdCB1c2VzCnJlc2VydmVkIGJpdHMgaW4gUFRFcy4gU2VlIGFsc28gdGhlIGZv
bGxvd2luZyBkaXNjdXNzaW9uIGZvciBtb3JlCmNvbnRleHQ6CiAgaHR0cHM6Ly9saXN0cy5nbnUu
b3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjQtMDIvbXNnMDA3NzUuaHRtbAoKVGhpcyBz
ZXJpZXMgcmVuYW1lcyAiVC1IZWFkIFBCTVQiIHRvICJNQUVFIiBhbmQgb25seSBlbmFibGVzIGl0
IGlmCnRoZSB0aC5zeHN0YXR1cy5NQUVFIGJpdCBpcyBzZXQuCgpUaGUgdGguc3hzdGF0dXMgQ1NS
IGlzIGRvY3VtZW50ZWQgaGVyZToKICBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvdGhl
YWQtZXh0ZW5zaW9uLXNwZWMvcHVsbC80NgoKVGhlIFFFTVUgcGF0Y2ggdG8gZW11bGF0ZSB0aC5z
eHN0YXR1cyB3aXRoIE1BRUUgbm90IHNldCBpcyBoZXJlOgogIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDMyOTEyMDQyNy42ODQ2NzctMS1jaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwu
ZXUvCgpBZnRlciBhcHBseWluZyB0aGUgcmVmZXJlbmNlZCBRRU1VIHBhdGNoLCB0aGlzIHBhdGNo
c2V0IGFsbG93cyB0bwpzdWNjZXNzZnVsbHkgYm9vdCBhIEM5MDYgUUVNVSBzeXN0ZW0gZW11bGF0
aW9uICgiLWNwdSB0aGVhZC1jOTA2IikuCgpDaHJpc3RvcGggTcO8bGxuZXIgKDIpOgogIHJpc2N2
OiB0aGVhZDogUmVuYW1lIFQtSGVhZCBQQk1UIHRvIE1BRUUKICByaXNjdjogVC1IZWFkOiBUZXN0
IGF2YWlsYWJpbGl0eSBiaXQgYmVmb3JlIGVuYWJsaW5nIE1BRUUgZXJyYXRhCgogYXJjaC9yaXNj
di9LY29uZmlnLmVycmF0YSAgICAgICAgICAgIHwgIDggKysrKy0tLS0KIGFyY2gvcmlzY3YvZXJy
YXRhL3RoZWFkL2VycmF0YS5jICAgICB8IDIyICsrKysrKysrKysrKysrLS0tLS0tLS0KIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8IDIwICsrKysrKysrKystLS0tLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0g
CjIuNDQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
