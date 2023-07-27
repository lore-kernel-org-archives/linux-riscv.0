Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D7C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qWaCXyPs8GyUYwyJb1AogqnQraX1tBg8SmdM9kJiK20=; b=i8Nd0l2130rbTa
	U6aZ8zRvp8RBBERt3cbbQTizW6wi/aTccGmUV/ZAmjgp1+ypyFSj76vRKwJdKcaFmlUR12wS9Y2YK
	lZdO80Uj1oQIMaAndpGNu+3nEjsMeC5f6AgwqUrFlWaccWIzkUIxcVYKxt5Bx9go+6MWevXFu9R64
	ya348sH33NLMJ35mevljZI6+fLcZnkfGgErerpRKDlrF1zH7lqJ/L0ZTG4h34AwYnkxQF6Sb/rrYO
	ipxXeQbf0GE52HoTvIa8iSNVgoN6MUgwHXMk5gTNlqVzlGErAgT85iMuxcCFObuQeTwfKtw+J3QQW
	nGxqjJStc35lRzcQRBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1lI-00F2Ut-0C;
	Thu, 27 Jul 2023 14:14:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1lD-00F2Om-1d
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:14:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317715ec496so1080640f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690467271; x=1691072071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eRw/cUGu8fcnPxw+KMMOjGF5bTHqXAR/GW2x87Rw3dw=;
        b=dA/0oC16Y7iRuAHbZ0n7kmQyHW2sbVHip1jppF98hz846ZU9Ac3FhBcMVz1BN7wQAv
         n6rWRQ9Oe/fpRKluovb17FotrSk27Fp/vXu/uvZowB+D0EMCB+ibgu2gj6mF81VA7/WM
         gOikeA2J5GodOO0o83+Kwf2Khyer8Lcz0yHNDW37sBfk+cu+uPKySkuB1yfUjHIcMSPp
         zYGcXq6fQS9j6kK8kEGVng0wnc50QyO+AhyYuqVhXNmu2gZAldWORTGZeta+7HAmUs31
         rNw+GmtcbI9m7Aj0Hz+UixmbpoBVbFTDVaDk00Je86nfD7NR8HYXWQT73Fij3pgc0Eaa
         lVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467271; x=1691072071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRw/cUGu8fcnPxw+KMMOjGF5bTHqXAR/GW2x87Rw3dw=;
        b=Q2i8E81bs0fvnt2YdKK97wK9CP5ZmC4BkP14c01aHAQ8Q6Ry+tm0TZxlIRYr2WGgyx
         K2DFDfK3X/iGwze9fwshExcfgEtgfyxou0Stv6xQZF86aS1s6C9q6v6dNglA/jLN05BM
         DwXma0MJotwItvck4DcQ7/BFV/goZR2fj4AqjJBmGYkdNgdYb3+/j0Vkw195NrChwluu
         QYT83/aqcqtAsZb+SkcKUyth//sNmURsS0cSiELLvFRdJ3Lfh4d+VQe6kkLYrxfxM1co
         FLEFbpEcMM7F1qDakRxQTgAyi7895Lb+6jNzoHCaZqbubhNVQ9D0KW3hBNdF68CSEcrM
         y6qg==
X-Gm-Message-State: ABy/qLaHiW581/3m3rYvZ0mbkC1xISTDATM2SsRvAezNfpMl6svXSc9E
	YuPy8C8vBiajBXB4TssXhM1INA==
X-Google-Smtp-Source: APBJJlE4sSE0D9stukeJcl06BIhweZAvV/Wivm9L17pK3nhJzWm3GrFSQ3BMSkamty6LskMNEBrLcw==
X-Received: by 2002:adf:de09:0:b0:315:96ca:dcab with SMTP id b9-20020adfde09000000b0031596cadcabmr1607584wrm.35.1690467271509;
        Thu, 27 Jul 2023 07:14:31 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d674f000000b0030ae3a6be4asm2193853wrw.72.2023.07.27.07.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:14:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
Date: Thu, 27 Jul 2023 16:14:18 +0200
Message-Id: <20230727141428.962286-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_071435_556796_4316A4B1 
X-CRM114-Status: GOOD (  17.31  )
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

cmlzY3YgdXNlZCB0byBhbGxvdyBkaXJlY3QgYWNjZXNzIHRvIGN5Y2xlL3RpbWUvaW5zdHJldCBj
b3VudGVycywKYnlwYXNzaW5nIHRoZSBwZXJmIGZyYW1ld29yaywgdGhpcyBwYXRjaHNldCBpbnRl
bmRzIHRvIGFsbG93IHRoZSB1c2VyIHRvCm1tYXAgYW55IGNvdW50ZXIgd2hlbiBhY2Nlc3NlZCB0
aHJvdWdoIHBlcmYuCgoqKkltcG9ydGFudCoqOiBUaGUgZGVmYXVsdCBtb2RlIGlzIG5vdyB1c2Vy
IGFjY2VzcyB0aHJvdWdoIHBlcmYgb25seSwgbm90CnRoZSBsZWdhY3kgc28gc29tZSBhcHBsaWNh
dGlvbnMgd2lsbCBicmVhay4gSG93ZXZlciwgd2UgaW50cm9kdWNlIGEgc3lzY3RsCnBlcmZfdXNl
cl9hY2Nlc3MgbGlrZSBhcm02NCBkb2VzLCB3aGljaCB3aWxsIGFsbG93IHRvIHN3aXRjaCB0byB0
aGUgbGVnYWN5Cm1vZGUgZGVzY3JpYmVkIGFib3ZlLgoKVGhpcyB2ZXJzaW9uIG5lZWRzIG9wZW5T
QkkgdjEuMyAqYW5kKiBhIGtlcm5lbCBmaXggdGhhdCB3ZW50IHVwc3RyZWFtIGxhdGVseQooaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDYxNjExNDgzMS4zMTg2OTgwLTEtbWF6QGtl
cm5lbC5vcmcvVC8pLgoKYmFzZS1jb21taXQtdGFnOiB2Ni41LXJjMQoKQ2hhbmdlcyBpbiB2NToK
LSBGaXggdHlwbyBmcm9tIEF0aXNoCi0gQWRkIFJCIGZyb20gQXRpc2ggYW5kIEFuZHJldwotIElt
cHJvdmUgY292ZXIgbGV0dGVyIGFuZCBwYXRjaCA3IGNvbW1pdCBsb2cgdG8gZXhwbGFpbiB3aHkg
d2UgbWFkZSB0aGUKICBjaG9pY2UgdG8gYnJlYWsgdXNlcnNwYWNlIGZvciBzZWN1cml0eSByZWFz
b25zLCB0aGFua3MgQXRpc2ggYW5kIFLDqW1pCi0gUmViYXNlIG9uIHRvcCBvZiB2Ni41LXJjMQoK
Q2hhbmdlcyBpbiB2NDoKLSBGaXhlZCBzb21lIG5pdHMgaW4gcmlzY3ZfcG11X3NiaS5jIHRoYW5r
cyB0byBBbmRyZXcKLSBGaXhlZCB0aGUgZG9jdW1lbnRhdGlvbiB0aGFua3MgdG8gQW5kcmV3Ci0g
QWRkZWQgUkIgZnJvbSBBbmRyZXcgXG8vCgpDaGFuZ2VzIGluIHYzOgotIHBhdGNoIDEgbm93IGNv
bnRhaW5zIHRoZSByZWYgdG8gdGhlIGZhdWx0eSBjb21taXQgKG5vIEZpeGVzIHRhZyBhcyBpdCBp
cyBvbmx5IGEgY29tbWVudCksIGFzIEFuZHJldyBzdWdnZXN0ZWQKLSBSZW1vdmVkIFJJU0NWX1BN
VV9MRUdBQ1lfVElNRSBmcm9tIHBhdGNoIDMsIGFzIEFuZHJldyBzdWdnZXN0ZWQKLSBSZW5hbWUg
UklTQ1ZfUE1VX1BERVZfTkFNRSB0byAicmlzY3YtcG11LXNiaSIsIHBhdGNoNCBpcyBqdXN0IGNv
c21ldGljIG5vdywgYXMgQW5kcmV3IHN1Z2dlc3RlZAotIFJlbW92ZWQgYSBmZXcgdXNlbGVzcyAo
YW5kIHdyb25nKSBjb21tZW50cywgYXMgQW5kcmV3IHN1Z2dlc3RlZAotIFNpbXBsaWZ5IGFyY2hf
cGVyZl91cGRhdGVfdXNlcnBhZ2UgY29kZSwgYXMgQW5kcmV3IHN1Z2dlc3RlZAotIERvY3VtZW50
YXRpb24gbm93IG1lbnRpb25zIHRoYXQgdGltZSBDU1IgaXMgKmFsd2F5cyogYWNjZXNzaWJsZSwg
d2hhdGV2ZXIgdGhlIG1vZGUsIGFzIHN1Z2dlc3RlZCBieSBBbmRyZXcKLSBSZW1vdmVkIENZQ0xF
SCByZWZlcmVuY2UgYW5kIGFkZCBUT0RPIGZvciBydjMyIHN1cHBvcnQsIGFzIHN1Z2dlc3RlZCBi
eSBBdGlzaAotIERvIG5vdCByZW5hbWUgdGhlIHBtdSBpbnN0YW5jZSBhcyBBdGlzaCBzdWdnZXN0
ZWQKLSBTZXQgcG1jX3dpZHRoIG9ubHkgaWYgcmRwbWMgaXMgZW5hYmxlZCBhbmQgQ09ORklHX1JJ
U0NWX1BNVSBpcyBzZXQgYW5kIHRoZSBldmVudCBpcyBhIGh3IGV2ZW50Ci0gTW92ZSBhcmNoX3Bl
cmZfdXBkYXRlX3VzZXJwYWdlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA2MTYx
MTQ4MzEuMzE4Njk4MC0xLW1hekBrZXJuZWwub3JnL1QvCi0gKipTd2l0Y2ggdG8gdXNlciBtb2Rl
IGFjY2VzcyBieSBkZWZhdWx0KioKCkNoYW5nZXMgaW4gdjI6Ci0gU3BsaXQgaW50byBzbWFsbGVy
IHBhdGNoZXMsIHdheSBiZXR0ZXIhCi0gQWRkIFJCIGZyb20gQ29ub3IKLSBTaW1wbGlmeSB0aGUg
d2F5IHdlIGNoZWNrZWQgcmlzY3YgYXJjaGl0ZWN0dXJlCi0gRml4IHJhY2UgbW1hcCBhbmQgb3Ro
ZXIgdGhyZWFkIHJ1bm5pbmcgb24gb3RoZXIgY3B1cwotIFVzZSBod2Mgd2hlbiBhdmFpbGFibGUK
LSBTZXQgYWxsIHVzZXJzcGFjZSBhY2Nlc3MgZmxhZ3MgaW4gZXZlbnRfaW5pdCwgdG9vIGN1bWJl
cnNvbWUgdG8gaGFuZGxlIHN5c2N0bCBjaGFuZ2VzCi0gRml4IGFyY2hfcGVyZl91cGRhdGVfdXNl
cnBhZ2UgZm9yIHBtdSBvdGhlciB0aGFuIHJpc2N2LXBtdSBieSByZW5hbWluZyBwbXUgZHJpdmVy
Ci0gRml4ZWQga2VybmVsIHRlc3Qgcm9ib3QgYnVpbGQgZXJyb3IKLSBGaXhlZCBkb2N1bWVudGF0
aW9uIChBbmRyZXcgYW5kIEJhZ2FzKQotIHBlcmYgdGVzdHN1aXRlIHBhc3NlcyBtbWFwIHRlc3Rz
IGluIGFsbCAzIG1vZGVzCgpBbGV4YW5kcmUgR2hpdGkgKDEwKToKICBwZXJmOiBGaXggd3Jvbmcg
Y29tbWVudCBhYm91dCBkZWZhdWx0IGV2ZW50X2lkeAogIGluY2x1ZGU6IHJpc2N2OiBGaXggd3Jv
bmcgaW5jbHVkZSBndWFyZCBpbiByaXNjdl9wbXUuaAogIHJpc2N2OiBNYWtlIGxlZ2FjeSBjb3Vu
dGVyIGVudW0gbWF0Y2ggdGhlIEhXIG51bWJlcmluZwogIGRyaXZlcnM6IHBlcmY6IFJlbmFtZSBy
aXNjdiBwbXUgc2JpIGRyaXZlcgogIHJpc2N2OiBQcmVwYXJlIGZvciB1c2VyLXNwYWNlIHBlcmYg
ZXZlbnQgbW1hcCBzdXBwb3J0CiAgZHJpdmVyczogcGVyZjogSW1wbGVtZW50IHBlcmYgZXZlbnQg
bW1hcCBzdXBwb3J0IGluIHRoZSBsZWdhY3kgYmFja2VuZAogIGRyaXZlcnM6IHBlcmY6IEltcGxl
bWVudCBwZXJmIGV2ZW50IG1tYXAgc3VwcG9ydCBpbiB0aGUgU0JJIGJhY2tlbmQKICBEb2N1bWVu
dGF0aW9uOiBhZG1pbi1ndWlkZTogQWRkIHJpc2N2IHN5c2N0bF9wZXJmX3VzZXJfYWNjZXNzCiAg
dG9vbHM6IGxpYjogcGVyZjogSW1wbGVtZW50IHJpc2N2IG1tYXAgc3VwcG9ydAogIHBlcmY6IHRl
c3RzOiBBZGFwdCBtbWFwLWJhc2ljLmMgZm9yIHJpc2N2CgogRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9zeXNjdGwva2VybmVsLnJzdCB8ICAyNyArKy0KIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUu
YyAgICAgICAgICAgICAgICAgICAgfCAxMTMgKysrKysrKysrKysKIGRyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfbGVnYWN5LmMgICAgICAgICAgICAgfCAgMjggKystCiBkcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jICAgICAgICAgICAgICAgIHwgMTk2ICsrKysrKysrKysrKysrKysrKystCiBpbmNs
dWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmggICAgICAgICAgICAgIHwgIDEyICstCiBpbmNsdWRl
L2xpbnV4L3BlcmZfZXZlbnQuaCAgICAgICAgICAgICAgICAgIHwgICAzICstCiB0b29scy9saWIv
cGVyZi9tbWFwLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDY1ICsrKysrKysKIHRvb2xzL3Bl
cmYvdGVzdHMvbW1hcC1iYXNpYy5jICAgICAgICAgICAgICAgfCAgIDQgKy0KIDggZmlsZXMgY2hh
bmdlZCwgNDI4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKLS0gCjIuMzkuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
