Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1F1C48297
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YTTg0j9lYC7H/f+ktdPF1Jue3kgb6FKbBB9Udzug/c=; b=oALM5EpBknTuLz
	qmYXs5uCA+XJAsHebWcP9xhCMetSZSROED9JPzP0XPzcWRtimpsxjkJDUzMlySy6sWN5Pe01hC72b
	Ejdctb9h282CVGkxhTbtW/Mbdlx0d5tcV8PoUnqA4+/8BGLcM8OYsXsp53bPhZNK3HUwc79h/lc7L
	5pOcPF/5uG/umckCqGjEkY9nh272sC6pDbWU2w0bHReJcBKlcWBQySLSY5bLUPS/e65yPHb+EZwhQ
	Mz75Mu0/7MxsWQ0VotNwcDBEK1wZkBu4l3QJkPS9PEcSfxplnh18/JogJ3Ebi1/rK1CovBhbMnwWz
	QUQ0toZRG/VOH8FD6pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZT-0000000GFr9-21po;
	Fri, 09 Feb 2024 06:41:11 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZP-0000000GFlO-3wfF
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 06:41:09 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a3864258438so110915366b.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 22:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1707460864; x=1708065664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqv1kMDueOeDBLAFFzoizkbUOaos7eIuqxmLJzXo0DE=;
        b=N7e4vF7p8+i7V2gKJKTmM7MfFKKUfMFqSGXw70lW+QcidTOl0WXiuXWWBDd+Fru4/6
         xMvdXkEs2YJXtYSi9xi6oYQ4ksX4T6KEa9UC0u+L3vXXWdsNL8KxIUnfIdHgR7bwr3vN
         3CXAtuy+Fx2rEgVf9WFq/pqK0tGASqQPyIHfoH08PvTsaCBw6z2EXbokwFRGHZpnYF6N
         UFR1d1LQZ5LYKQiSPc0+zrKUUdPlv/RNZuyGQWrfumBfXnqPdkmenSF6WVTxg/XOQUY0
         VAqiRlpkadzcP8nLVRtNFvjS/1bEyNycEzks4HJwg8l4Zu6qX6hi+5hy2TJBKfGReqyI
         qYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707460864; x=1708065664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqv1kMDueOeDBLAFFzoizkbUOaos7eIuqxmLJzXo0DE=;
        b=PVVioyTbbjGVtM1hYImYSJy4Xu7R/aUspJZbp1MF7m2bbRpTbeJK+Z/6tsLZx+x6RM
         fjtoiYHmdgdy+EKuC5e5X130C3kFjKhc6B72hepto5tzQMAwBM1VtR6s+gzGtwZ0RGoS
         4vdQQhq+Fyqy6KEP2F3vR6JTbo4t2+E65+Ceed/TppoxWj14/7c6PglOY+3WitqLjp28
         VgPx2X0vsDnclhUD+Trvwco1N4vARpQa0d8YBd0wLpD3K6SaI6sHdtZl48fZDuz6DDvt
         0TuqXapSJgXX3KPWDds9TQ03G0uHw3y7SS6NLVUExHvvXF6jnf8R4p5ytT/5Oth3Duxd
         kl1Q==
X-Gm-Message-State: AOJu0YwCQUyqmULDktzuw/kuuojIuduUshrUS7iXU6W+3CRxv2uaTqQD
	B+GOUfG757CfEGWxrCzfWUX0aJiaKmi2YvpjwKZxatUS3SvHryA66ZWvKAZiPs2svfn8CQKmI0G
	zFv8=
X-Google-Smtp-Source: AGHT+IEqYoT9P4yGxxV/Ao8vom6ObPUGe8xNfmYsrj9mQrupH69Vmjj5Fc9hQWs8Ax3BJgQO4kgnZg==
X-Received: by 2002:a17:906:5913:b0:a3b:e92b:2a41 with SMTP id h19-20020a170906591300b00a3be92b2a41mr102530ejq.13.1707460864179;
        Thu, 08 Feb 2024 22:41:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqA02Hms1GnUHhoCeUGdttK/loHEZjbx5QHKXwtPOxxttGYOksuXyK3muEb0xliNnRKF6szoFyOSFwsz9PcaJko6qKNjXTFB2fAnAyUpnMoVD+BQG/lDIsKGVkKuNnMy7wzKsP39NZoAmg06wjeoSHXyfFAN5cEbS/6EnYBTKMlzhMZrDk5pfPc0uIXGdiLw/6BaMIhcMFITP5pb19J+1RzF1urgzUtqlh9B3W/WQuGvzEkbSKup3S6Ti9kxG8XeGvyWsAft1kmMY1VJ6TJbTHHR1wRt2CPbV9ydGIIqh/nQ9xc08W/kJCzxUtTilHW2TunSFgIeJzQ3lp9ayfyWx2182k/ndXiSX8IaP8KBgE8qY5GSVV+bdIJ5yQSQN9sfvgp75UBDTSZI2KE/8h2zApaSfOvP1gqYu/l6w5sOHk5uXmxwNtsDKPg/gvNYpxPQv7s2Gux4RWuG/wgzzPenpKcbPz33H0ukQHd5hP61bQyFOi56bWkPzdKg5iSEHJwmX+hUwCtRf1aFZLCk8jDQBfrf6u7hMgQG4Fzd/mXKTkwTYwYGWEuSXv/GdHqagQcbufcOpMEPv8GUrFRZPXbb+AgJhrcf6yK9tzrRxobSk9dGB+n3QindAud8ArE7rKrG9g6aIUWMuYYYRNaST1o7FvBqxYWk3FP3yx7itHhzpZNOWGtzCqfkGtd8D6UmbZdt4aCSQKBYYs0yt3Y4BwVSmaxyAQ8wD7McQfbqmqIViPqNjTuTbrEnVlJxms4USHpISc/HAc/2iE4gnsIRzEnNdlnrvq5C/hROjT2FFt8cZ7PhawJvwaZWx3U3nXNWMQeSN47hTgcGZa24eiYOELFMolR5ikwa245mlzkn2LoKfrnA==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id vb9-20020a170907d04900b00a370a76d3a0sm441180ejc.123.2024.02.08.22.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:41:03 -0800 (PST)
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
Subject: [RFC PATCH v2 5/6] RISC-V: Expose Ssdtso via hwprobe API
Date: Fri,  9 Feb 2024 07:40:49 +0100
Message-ID: <20240209064050.2746540-6-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
References: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_224108_061545_D206AC9E 
X-CRM114-Status: GOOD (  12.61  )
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

VGhpcyBwYXRjaCBhZGRzIFNzZHRzbyB0byB0aGUgbGlzdCBvZiBleHRlbnNpb25zIHdoaWNoCmFy
ZSBhbm5vdW5jZWQgdG8gdXNlci1zcGFjZSB1c2luZyB0ZSBod3Byb2JlIEFQSS4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgot
LS0KIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCAzICsrKwogYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYyAgICAgICB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIv
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGIyYmNjOWVlZDlhYS4u
ZDg4MWQ1NmViYTM3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xODgs
NiArMTg4LDkgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAgICAgIG1hbnVh
bCBzdGFydGluZyBmcm9tIGNvbW1pdCA5NWNmMWY5ICgiQWRkIGNoYW5nZXMgcmVxdWVzdGVkIGJ5
IFZlZAogICAgICAgIGR1cmluZyBzaWdub2ZmIikKIAorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX0VYVF9TU0RUU09gOiBUaGUgU3NkdHNvIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisg
ICAgICAgaW4gdmVyc2lvbiB2MS4wLWRyYWZ0MyBvZiB0aGUgY29ycmVzcG9uZGluZyBleHRlbnNp
b24uCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFz
ayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxl
Y3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmgKaW5kZXggOWYyYThlM2ZmMjA0Li5lZTZlODMwYWJlNGQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaApAQCAtNTksNiArNTksNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7
CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVFNPCQkoMVVMTCA8PCAzMykKICNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pBQ0FTCQkoMVVMTCA8PCAzNCkKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pJQ09ORAkoMVVMTCA8PCAzNSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1NTRFRTTwkoMVVMTCA8PCAzNikKICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8w
CTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOCSgwIDw8IDApCiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwgMCkKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jCmluZGV4IGE3YzU2YjQxZWZkMi4uOTAyNDA2MWU5MTkzIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMKQEAgLTEzMiw2ICsxMzIsOCBAQCBzdGF0aWMgdm9pZCBod3Byb2Jl
X2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkJRVhUX0tFWShaRkhNSU4p
OwogCQkJRVhUX0tFWShaRkEpOwogCQl9CisKKwkJRVhUX0tFWShTU0RUU08pOwogI3VuZGVmIEVY
VF9LRVkKIAl9CiAKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
