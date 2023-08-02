Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC23AC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8YnipIqGMWVq+y1bSNrl0whGxQwCMORd7Wdmb7nu9qk=; b=zZ5F9gvVBWIGV3
	I3by2ohFJFLuTRHjcuza5MGrYBc5VhFgSwBEnDJzTu2HrjGhP2QqnSnBEL72rC4YnJq3pBVPTD428
	rxg4CUmrJ+jwP0AAkmpWLTzm9XdDIdHYT97isbe4R7VCJpkBwhzKLfby0V1ve8KnyDNYKJlXVswtc
	seQtYe9PySRpH13TmMeF0lRtDyqMuqrcH0PwuPpL9d1KatiQkwRFjc6EJjb9wHEMiPP4ccj+KwnCb
	5SOty8gPfxYqn22MvXBCznfoSkpuSOXja1XJU+JqESQeJA4fjsLQTrXOgxG6fOwtobbxadtJETXG3
	T8p73c2M65gCGJNFCSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6pz-004JhR-24;
	Wed, 02 Aug 2023 08:04:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6pw-004Jg7-00
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:04:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso3854455e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963442; x=1691568242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ/J00kEJAH5Xut374nMK9bufEJjwUvOp4VXeqDa+Tk=;
        b=TR4+KtOpPWWB7zMxB9PgPgMQ/dmKpI2IOf32w75D9jzFT4t3NfzAhSGg405n8kCuhn
         kyYUR4xFpYscU7oxOcPiJc2yOOlfvs9R4fNuiNBCQmV9beI/91TN+kKBuM5CI0EE8VBO
         vMHyHKRvn3MFWlA61V26A+Rzez+kE2tM2iMadEmGEeYqCOIHazGf32wjXpL/NVOu7Dps
         iJ2qq5Nn5iSwo9aR9TjLTcE+F1O+/en60hHyXmTZuO7Bt3BDY1tGvRzQETlyKtaTCMnY
         oZhJX722C9T9OKR3dBJH9VHSZYG/uY3H9NJNAbfFSAZBZ5dJrFpk3B4IiHaTcFimTrUV
         qTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963442; x=1691568242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQ/J00kEJAH5Xut374nMK9bufEJjwUvOp4VXeqDa+Tk=;
        b=MA543yw69+oLul2NnSZ14Z3ZBXGfy/OTAyRXmwtT6iTcD2t8UnOrSChQmoQvhSvS24
         fVoiBKHCzoHQ14HOn7KvCDm+g4GvB8FqB0L/esPyqtQq6Wlrz/bZ3KsZkMS1xJFS14Rb
         mqH3IY79EKD6rJNaWI476Jajp1N9tmJB0aOPk+e6yXHC3HC2/Bn/aG21PwJe0huMSpPT
         9LHpMi+YtJBOyr4ckhcqwuWMzVL6gFlr2K/b3PEZ1CcbXEUdkA6lLDpxCn0pMhXRIs5o
         w61HQZWYS6Ri4dkf3vTZT7h7nLaRueyMZ4iELWzf9T0q4E6u8wGtmXzAalAr3i9zsuhe
         EU8Q==
X-Gm-Message-State: ABy/qLbMzycmHlogq8jSBeeFc2bh5FWc1QRSrd0OGezPPLfRq2hmxZ98
	DtT/zLPSF2ItDam85a9iqdpWOA==
X-Google-Smtp-Source: APBJJlGkfK1cMubjw5jAx7xv31P0b4h+hmVBpPD+Xx9CKLBF6Ee3UXefcdhFfKa5u+4OBBC3XEAG3Q==
X-Received: by 2002:a7b:c394:0:b0:3fe:1b5e:82 with SMTP id s20-20020a7bc394000000b003fe1b5e0082mr3691989wmj.20.1690963441714;
        Wed, 02 Aug 2023 01:04:01 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d54c1000000b003176f2d9ce5sm18338098wrv.71.2023.08.02.01.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:04:01 -0700 (PDT)
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
Subject: [PATCH v6 00/10] riscv: Allow userspace to directly access perf counters
Date: Wed,  2 Aug 2023 10:03:18 +0200
Message-Id: <20230802080328.1213905-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_010404_036320_80D87FFA 
X-CRM114-Status: GOOD (  17.30  )
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
cm5lbC5vcmcvVC8pLgoKYmFzZS1jb21taXQtdGFnOiB2Ni41LXJjMQoKQ2hhbmdlcyBpbiB2NjoK
LSBSZXBsYWNlZCBjc3JfcmVhZCgpIHByZXByb2Nlc3NvciBwYXJzaW5nIG9mIGNzciBudW1iZXIg
d2l0aCB0aGUKICBpbnB1dCBjb25zdHJhaW50LCBhcyBzdWdnZXN0ZWQgYnkgSWFuCi0gQWRkZWQg
YSBkZWZpbmVkKF9fcmlzY3YpIGFuZCBhIGNvbW1lbnQgdG8gbWFrZSB0aGluZ3MgY2xlYXJlciwg
YXMKICBzdWdnZXN0ZWQgYnkgSWFuCgpDaGFuZ2VzIGluIHY1OgotIEZpeCB0eXBvIGZyb20gQXRp
c2gKLSBBZGQgUkIgZnJvbSBBdGlzaCBhbmQgQW5kcmV3Ci0gSW1wcm92ZSBjb3ZlciBsZXR0ZXIg
YW5kIHBhdGNoIDcgY29tbWl0IGxvZyB0byBleHBsYWluIHdoeSB3ZSBtYWRlIHRoZQogIGNob2lj
ZSB0byBicmVhayB1c2Vyc3BhY2UgZm9yIHNlY3VyaXR5IHJlYXNvbnMsIHRoYW5rcyBBdGlzaCBh
bmQgUsOpbWkKLSBSZWJhc2Ugb24gdG9wIG9mIHY2LjUtcmMxCgpDaGFuZ2VzIGluIHY0OgotIEZp
eGVkIHNvbWUgbml0cyBpbiByaXNjdl9wbXVfc2JpLmMgdGhhbmtzIHRvIEFuZHJldwotIEZpeGVk
IHRoZSBkb2N1bWVudGF0aW9uIHRoYW5rcyB0byBBbmRyZXcKLSBBZGRlZCBSQiBmcm9tIEFuZHJl
dyBcby8KCkNoYW5nZXMgaW4gdjM6Ci0gcGF0Y2ggMSBub3cgY29udGFpbnMgdGhlIHJlZiB0byB0
aGUgZmF1bHR5IGNvbW1pdCAobm8gRml4ZXMgdGFnIGFzIGl0IGlzIG9ubHkgYSBjb21tZW50KSwg
YXMgQW5kcmV3IHN1Z2dlc3RlZAotIFJlbW92ZWQgUklTQ1ZfUE1VX0xFR0FDWV9USU1FIGZyb20g
cGF0Y2ggMywgYXMgQW5kcmV3IHN1Z2dlc3RlZAotIFJlbmFtZSBSSVNDVl9QTVVfUERFVl9OQU1F
IHRvICJyaXNjdi1wbXUtc2JpIiwgcGF0Y2g0IGlzIGp1c3QgY29zbWV0aWMgbm93LCBhcyBBbmRy
ZXcgc3VnZ2VzdGVkCi0gUmVtb3ZlZCBhIGZldyB1c2VsZXNzIChhbmQgd3JvbmcpIGNvbW1lbnRz
LCBhcyBBbmRyZXcgc3VnZ2VzdGVkCi0gU2ltcGxpZnkgYXJjaF9wZXJmX3VwZGF0ZV91c2VycGFn
ZSBjb2RlLCBhcyBBbmRyZXcgc3VnZ2VzdGVkCi0gRG9jdW1lbnRhdGlvbiBub3cgbWVudGlvbnMg
dGhhdCB0aW1lIENTUiBpcyAqYWx3YXlzKiBhY2Nlc3NpYmxlLCB3aGF0ZXZlciB0aGUgbW9kZSwg
YXMgc3VnZ2VzdGVkIGJ5IEFuZHJldwotIFJlbW92ZWQgQ1lDTEVIIHJlZmVyZW5jZSBhbmQgYWRk
IFRPRE8gZm9yIHJ2MzIgc3VwcG9ydCwgYXMgc3VnZ2VzdGVkIGJ5IEF0aXNoCi0gRG8gbm90IHJl
bmFtZSB0aGUgcG11IGluc3RhbmNlIGFzIEF0aXNoIHN1Z2dlc3RlZAotIFNldCBwbWNfd2lkdGgg
b25seSBpZiByZHBtYyBpcyBlbmFibGVkIGFuZCBDT05GSUdfUklTQ1ZfUE1VIGlzIHNldCBhbmQg
dGhlIGV2ZW50IGlzIGEgaHcgZXZlbnQKLSBNb3ZlIGFyY2hfcGVyZl91cGRhdGVfdXNlcnBhZ2Ug
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDYxNjExNDgzMS4zMTg2OTgwLTEtbWF6
QGtlcm5lbC5vcmcvVC8KLSAqKlN3aXRjaCB0byB1c2VyIG1vZGUgYWNjZXNzIGJ5IGRlZmF1bHQq
KgoKQ2hhbmdlcyBpbiB2MjoKLSBTcGxpdCBpbnRvIHNtYWxsZXIgcGF0Y2hlcywgd2F5IGJldHRl
ciEKLSBBZGQgUkIgZnJvbSBDb25vcgotIFNpbXBsaWZ5IHRoZSB3YXkgd2UgY2hlY2tlZCByaXNj
diBhcmNoaXRlY3R1cmUKLSBGaXggcmFjZSBtbWFwIGFuZCBvdGhlciB0aHJlYWQgcnVubmluZyBv
biBvdGhlciBjcHVzCi0gVXNlIGh3YyB3aGVuIGF2YWlsYWJsZQotIFNldCBhbGwgdXNlcnNwYWNl
IGFjY2VzcyBmbGFncyBpbiBldmVudF9pbml0LCB0b28gY3VtYmVyc29tZSB0byBoYW5kbGUgc3lz
Y3RsIGNoYW5nZXMKLSBGaXggYXJjaF9wZXJmX3VwZGF0ZV91c2VycGFnZSBmb3IgcG11IG90aGVy
IHRoYW4gcmlzY3YtcG11IGJ5IHJlbmFtaW5nIHBtdSBkcml2ZXIKLSBGaXhlZCBrZXJuZWwgdGVz
dCByb2JvdCBidWlsZCBlcnJvcgotIEZpeGVkIGRvY3VtZW50YXRpb24gKEFuZHJldyBhbmQgQmFn
YXMpCi0gcGVyZiB0ZXN0c3VpdGUgcGFzc2VzIG1tYXAgdGVzdHMgaW4gYWxsIDMgbW9kZXMKCkFs
ZXhhbmRyZSBHaGl0aSAoMTApOgogIHBlcmY6IEZpeCB3cm9uZyBjb21tZW50IGFib3V0IGRlZmF1
bHQgZXZlbnRfaWR4CiAgaW5jbHVkZTogcmlzY3Y6IEZpeCB3cm9uZyBpbmNsdWRlIGd1YXJkIGlu
IHJpc2N2X3BtdS5oCiAgcmlzY3Y6IE1ha2UgbGVnYWN5IGNvdW50ZXIgZW51bSBtYXRjaCB0aGUg
SFcgbnVtYmVyaW5nCiAgZHJpdmVyczogcGVyZjogUmVuYW1lIHJpc2N2IHBtdSBzYmkgZHJpdmVy
CiAgcmlzY3Y6IFByZXBhcmUgZm9yIHVzZXItc3BhY2UgcGVyZiBldmVudCBtbWFwIHN1cHBvcnQK
ICBkcml2ZXJzOiBwZXJmOiBJbXBsZW1lbnQgcGVyZiBldmVudCBtbWFwIHN1cHBvcnQgaW4gdGhl
IGxlZ2FjeSBiYWNrZW5kCiAgZHJpdmVyczogcGVyZjogSW1wbGVtZW50IHBlcmYgZXZlbnQgbW1h
cCBzdXBwb3J0IGluIHRoZSBTQkkgYmFja2VuZAogIERvY3VtZW50YXRpb246IGFkbWluLWd1aWRl
OiBBZGQgcmlzY3Ygc3lzY3RsX3BlcmZfdXNlcl9hY2Nlc3MKICB0b29sczogbGliOiBwZXJmOiBJ
bXBsZW1lbnQgcmlzY3YgbW1hcCBzdXBwb3J0CiAgcGVyZjogdGVzdHM6IEFkYXB0IG1tYXAtYmFz
aWMuYyBmb3IgcmlzY3YKCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwu
cnN0IHwgIDI3ICsrLQogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jICAgICAgICAgICAgICAgICAg
ICB8IDExMyArKysrKysrKysrKwogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYyAgICAg
ICAgICAgICB8ICAyOCArKy0KIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICAgICAgICAg
ICAgICAgfCAxOTYgKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvbGludXgvcGVyZi9yaXNj
dl9wbXUuaCAgICAgICAgICAgICAgfCAgMTIgKy0KIGluY2x1ZGUvbGludXgvcGVyZl9ldmVudC5o
ICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIHRvb2xzL2xpYi9wZXJmL21tYXAuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNjYgKysrKysrKwogdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2lj
LmMgICAgICAgICAgICAgICB8ICAgNiArLQogOCBmaWxlcyBjaGFuZ2VkLCA0MzEgaW5zZXJ0aW9u
cygrKSwgMjAgZGVsZXRpb25zKC0pCgotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
