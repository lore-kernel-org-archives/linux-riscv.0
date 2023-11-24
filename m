Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D610CC636BD
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IcJRlQbtwFDvPzU3yPDAouAzKQWfFyrSinpwM3JhS2g=; b=CaJbXTTp8rDlF/
	lVlcOz+yuufUkeGTIP33HbtC4Zq06mJ88X3OZAycRxIKBVppA87RVuLGJmbn8aF4uS1Ur5BxDGJyC
	TLA1D88XqZHCgIMiuzCmoWQTtGu9iANm5a7nX6WQRm2X/YBzpqUKQB3v5mUKTH0fZFuAc5fj+vN7m
	VTDbIsMoiQk+a05FxNgDBtOo4bmOEI1mGHO5qnfrWr38E1yZwuzl8/yb4Z90Pm8SViiwnAqVrS+d7
	kn2fCrCZurmXEZ27sd8h/26UiQ+d5VkngXGXFOouL0f3mr6cmVXK2RPrUMUP0OKzS3pu1QYvj4QDD
	ak0qY3sS0S7flxSMwb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QW3-006NPR-2b;
	Fri, 24 Nov 2023 07:22:19 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QVx-006NK2-2g
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:22:15 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a02ba1f500fso228074566b.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700810530; x=1701415330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdW6KLqAappiJz7t43GP8yDkVw3RQUH/PCIQaxhT8io=;
        b=bi1NBLP/85G9uEMMwZk9UmoT5CN69idPqwD+DDi30xpJTv6T0Rnz5ASXOLh2eV+LaF
         f3iBL+vDl5eHKxLVTbfrKp/4oMXZxzsM1N80L2QvRe0Pkn3qHALM2OQ5byUsxJPidmvG
         0oTuicSSpGs+MH76U0afRaXcMuBI7jZC7VVT9kpdXVWowP1ZY0QRWoZxnOQ30txSM/Hq
         oFEb+rFR6bGLUARShMRDpY5+zON3gL0y7CEo0ww1OaG9jNnDNwxIxdJW/hWPdJRtj1xf
         NY/6A4QSSgkIBpURnPODZz6y5giXQuqIMSLtVBDfKZ47KNu0OMGLwXohdrFPOf//lYXB
         YsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700810530; x=1701415330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdW6KLqAappiJz7t43GP8yDkVw3RQUH/PCIQaxhT8io=;
        b=d0UDQs5xLhRdn/IFkEENmAGgOrzwKQjsW4zawAq/l/hCizh4DQDfGIm99OuMf90Ja/
         4HisX8F41qLJTURMTvWDFzCNjPhbIc/HHVyjQtQoKgPTKn1MvmM/qHZ0nng2yMTu4OHG
         4zRYBj/+F6kPE1kjrOkZlhoGGUit2Q837XKgwNzoTvcOb57eD9uoog0pl19SaJZyiHtX
         z7PrTuxaw8QzUDIpEVOr5ZeQ9HAdFyJKvOKZ1/ca5FaNatxx+iMwSWk+ngdbi4kewsv2
         9viS+FZ+E0uv7wy3rztfj+YMYASAAU8P4HBHKlc2UBv+2uCmW1WjFJnY/bv6cA+Oep5K
         iCEw==
X-Gm-Message-State: AOJu0YyiyOi3aiF91mSuRniRZW/yPKTH1e2I7EBGFrPwJHLkIzquReXU
	NwlQ/b6tofRdztL5SO1OrfFaXd0tt5nozqveUmP0QuMr
X-Google-Smtp-Source: AGHT+IH6YJTwKcWKKY/43rAcT0UuuNs5BImrDdkrAupQGRjsaG9PttQVyjsPB2Eshk3SwrOXEogoeQ==
X-Received: by 2002:a17:906:220c:b0:a09:e716:5ea8 with SMTP id s12-20020a170906220c00b00a09e7165ea8mr121667ejs.18.1700810530557;
        Thu, 23 Nov 2023 23:22:10 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709060e5200b00992f2befcbcsm1709930eji.180.2023.11.23.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:22:10 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
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
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH 3/5] uapi: prctl: Add new prctl call to set/get the memory consistency model
Date: Fri, 24 Nov 2023 08:21:40 +0100
Message-ID: <20231124072142.2786653-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_232213_870035_BA574554 
X-CRM114-Status: GOOD (  24.31  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpT
b21lIElTQXMgaGF2ZSBhIHdlYWsgZGVmYXVsdCBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwgYW5k
IGFsbG93IHRvIHN3aXRjaAp0byBhIG1vcmUgc3RyaWN0IG1vZGVsIGF0IHJ1bnRpbWUuIFRoaXMg
cGF0Y2ggYWRkcyBjYWxscyB0byB0aGUgcHJjdGwKaW50ZXJmYWNlIHdoaWNoIGFsbG93IHRvIGdl
dCBhbmQgc2V0IHRoZSBjdXJyZW50IG1lbW9yeSBjb25zaXN0ZW5jeQptb2RlbC4KClRoZSBpbXBs
ZW1lbnRhdGlvbiBmb2xsb3dzIHRoZSB3YXkgb3RoZXIgcHJjdGwgY2FsbHMgYXJlIGltcGxlbWVu
dGVkIGJ5CmRpc2FibGluZyB0aGVtIHVubGVzcyBhcmNoLXNwZWNpZmljIGNvZGUgcHJvdmlkZXMg
dGhlIHJlbGV2YW50IG1hY3Jvcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8
Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PgotLS0KIC4uLi9tbS9keW5hbWljLW1lbW9yeS1j
b25zaXN0ZW5jeS1tb2RlbC5yc3QgICB8IDU4ICsrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUv
dWFwaS9saW51eC9wcmN0bC5oICAgICAgICAgICAgICAgICAgICB8ICAzICsKIGtlcm5lbC9zeXMu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysKIDMgZmlsZXMgY2hh
bmdlZCwgNzMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
bW0vZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0CgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9tbS9keW5hbWljLW1lbW9yeS1jb25zaXN0ZW5jeS1tb2RlbC5yc3QgYi9Eb2N1
bWVudGF0aW9uL21tL2R5bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVsLnJzdApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjIxNjc1YjQxZWM4NAotLS0gL2Rldi9u
dWxsCisrKyBiL0RvY3VtZW50YXRpb24vbW0vZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9k
ZWwucnN0CkBAIC0wLDAgKzEsNTggQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCisKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CitEeW5hbWljIG1lbW9yeSBj
b25zaXN0ZW5jeSBtb2RlbAorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKworVGhp
cyBkb2N1bWVudCBnaXZlcyBhbiBvdmVydmlldyBvZiB0aGUgdXNlcnNwYWNlIGludGVyZmFjZSB0
byBjaGFuZ2UgbWVtb3J5Citjb25zaXN0ZW5jeSBtb2RlbCBhdCBydW4tdGltZS4KKworCitXaGF0
IGlzIGEgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsPworPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KKworVGhlIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbCBpcyBhIHNldCBvZiBn
dWFyYW50ZWVzIGEgQ1BVIGFyY2hpdGVjdHVyZQorcHJvdmlkZXMgYWJvdXQgKHJlLSlvcmRlcmlu
ZyBtZW1vcnkgYWNjZXNzZXMuIEVhY2ggYXJjaGl0ZWN0dXJlIGRlZmluZXMKK2l0cyBvd24gbW9k
ZWwgYW5kIHNldCBvZiBydWxlcyB3aXRoaW4gdGhhdCwgd2hpY2ggYXJlIGNhcmVmdWxseSBzcGVj
aWZpZWQuCitUaGUgcHJvdmlkZWQgZ3VhcmFudGVlcyBoYXZlIGNvbnNlcXVlbmNlcyBmb3IgdGhl
IG1pY3JvYXJjaGl0ZWN0dXJlcyAoZS5nLiwKK3NvbWUgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVs
cyBhbGxvdyByZW9yZGVyaW5nIHN0b3JlcyBhZnRlciBsb2FkcykgYW5kCit0aGUgc29mdHdhcmUg
ZXhlY3V0ZWQgd2l0aGluIHRoaXMgbW9kZWwgKG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbHMgdGhh
dAorYWxsb3cgcmVvcmRlcmluZyBtZW1vcnkgYWNjZXNzZXMgcHJvdmlkZSBtZW1vcnkgYmFycmll
ciBpbnN0cnVjdGlvbnMKK3RvIGVuZm9yY2UgYWRkaXRpb25hbCBndWFyYW50ZWVzIHdoZW4gbmVl
ZGVkIGV4cGxpY2l0bHkpLgorCitEZXRhaWxzIGFib3V0IHRoZSBhcmNoaXRlY3R1cmUtaW5kZXBl
bmRlbnQgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsIGFic3RyYWN0aW9uCitpbiB0aGUgTGludXgg
a2VybmVsIGFuZCB0aGUgdXNlIG9mIHRoZSBkaWZmZXJlbnQgdHlwZXMgb2YgbWVtb3J5IGJhcnJp
ZXJzCitjYW4gYmUgZm91bmQgaGVyZToKKworCURvY3VtZW50YXRpb24vbWVtb3J5LWJhcnJpZXJz
LnR4dAorCitUd28gbW9kZWxzIGNhbiBiZSBpbiBhIHdlYWtlci9zdHJvbmdlciByZWxhdGlvbi4g
SS5lLiwgYSBjb25zaXN0ZW5jeQorbW9kZWwgQSBpcyB3ZWFrZXIvc3Ryb25nZXIgdGhhbiBhbm90
aGVyIG1vZGVsIEIgaWYgQSBwcm92aWRlcyBhIHN1YnNldC9zdXBlcnNldAorb2YgdGhlIGNvbnN0
cmFpbnRzIHRoYXQgQiBwcm92aWRlcy4KKworU29tZSBhcmNoaXRlY3R1cmVzIGRlZmluZSBtb3Jl
IHRoYW4gb25lIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbC4KK09uIHN1Y2ggYXJjaGl0ZWN0dXJl
cywgc3dpdGNoaW5nIHRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwgYXQgcnVuLXRpbWUKK3Rv
IGEgc3Ryb25nZXIgb25lIGlzIHBvc3NpYmxlIGJlY2F1c2Ugc29mdHdhcmUgd3JpdHRlbiBmb3Ig
dGhlIHdlYWtlciBtb2RlbCBpcworY29tcGF0aWJsZSB3aXRoIHRoZSBjb25zdHJhaW50cyBvZiB0
aGUgc3Ryb25nZXIgbW9kZWwuCisKK0lmIHR3byBtb2RlbHMgYXJlIG5vdCBpbiBhIHdlYWtlci9z
dHJvbmdlciByZWxhdGlvbiwgc3dpdGNoaW5nIGJldHdlZW4KK3RoZW0gd2lsbCB2aW9sYXRlIHRo
ZSBjb25zaXN0ZW5jeSBhc3N1bXB0aW9ucyB0aGF0IHRoZSBzb2Z0d2FyZSB3YXMKK3dyaXR0ZW4g
dW5kZXIgKGkuZS4sIGNhdXNpbmcgc3VidGxlIGJ1Z3MgdGhhdCBhcmUgdmVyeSBoYXJkIHRvIGRl
YnVnKS4KKworVXNlciBBUEkgdmlhIHByY3RsCis9PT09PT09PT09PT09PT09PT0KKworVHdvIHBy
Y3RsIGNhbGxzIGFyZSBkZWZpbmVkIHRvIGdldC9zZXQgdGhlIGFjdGl2ZSBtZW1vcnkgY29uc2lz
dGVuY3kgbW9kZWw6CisKKyogcHJjdGwoUFJfR0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCkK
KworICAgIFJldHVybnMgdGhlIGFjdGl2ZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwgZm9yIHRo
ZSBjYWxsaW5nIHByb2Nlc3MvdGhyZWFkLgorICAgIElmIHRoZSBhcmNoaXRlY3R1cmUgZG9lcyBu
b3Qgc3VwcG9ydCBkeW5hbWljIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbHMsCisgICAgdGhlbiAt
MSBpcyByZXR1cm5lZCwgYW5kIGVycm5vIGlzIHNldCB0byBFSU5WQUwuCisKKyogcHJjdGwoUFJf
U0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCwgdW5zaWduZWQgbG9uZyBuZXdfbW9kZWwpCisK
KyAgICBTd2l0Y2hlcyB0aGUgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsIGZvciB0aGUgY2FsbGlu
ZyBwcm9jZXNzL3RocmVhZAorICAgIHRvIHRoZSBnaXZlbiBtb2RlbC4gSWYgdGhlIGFyY2hpdGVj
dHVyZSBkb2VzIG5vdCBzdXBwb3J0IGR5bmFtaWMKKyAgICBtZW1vcnkgY29uc2lzdGVuY3kgbW9k
ZWxzIG9yIGRvZXMgbm90IHN1cHBvcnQgdGhlIHByb3ZpZGVkIG1vZGVsLCB0aGVuCisgICAgLTEg
aXMgcmV0dXJuZWQsIGFuZCBlcnJubyBpcyBzZXQgdG8gRUlOVkFMLgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2xpbnV4L3ByY3RsLmggYi9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaAppbmRl
eCAzNzBlZDE0YjFhZTAuLjU3OTY2MjczMWVhYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xp
bnV4L3ByY3RsLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmgKQEAgLTMwNiw0ICsz
MDYsNyBAQCBzdHJ1Y3QgcHJjdGxfbW1fbWFwIHsKICMgZGVmaW5lIFBSX1JJU0NWX1ZfVlNUQVRF
X0NUUkxfTkVYVF9NQVNLCTB4YwogIyBkZWZpbmUgUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9NQVNL
CQkweDFmCiAKKyNkZWZpbmUgUFJfU0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTAkJNzEKKyNk
ZWZpbmUgUFJfR0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTAkJNzIKKwogI2VuZGlmIC8qIF9M
SU5VWF9QUkNUTF9IICovCmRpZmYgLS1naXQgYS9rZXJuZWwvc3lzLmMgYi9rZXJuZWwvc3lzLmMK
aW5kZXggZTIxOWZjZmExMTJkLi5hOGEyMTdhMTA3NjcgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9zeXMu
YworKysgYi9rZXJuZWwvc3lzLmMKQEAgLTE0Niw2ICsxNDYsMTIgQEAKICNpZm5kZWYgUklTQ1Zf
Vl9HRVRfQ09OVFJPTAogIyBkZWZpbmUgUklTQ1ZfVl9HRVRfQ09OVFJPTCgpCQkoLUVJTlZBTCkK
ICNlbmRpZgorI2lmbmRlZiBTRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMCisjIGRlZmluZSBT
RVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMCSgtRUlOVkFMKQorI2VuZGlmCisjaWZuZGVmIEdF
VF9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUwKKyMgZGVmaW5lIEdFVF9NRU1PUllfQ09OU0lTVEVO
Q1lfTU9ERUwJKC1FSU5WQUwpCisjZW5kaWYKIAogLyoKICAqIHRoaXMgaXMgd2hlcmUgdGhlIHN5
c3RlbS13aWRlIG92ZXJmbG93IFVJRCBhbmQgR0lEIGFyZSBkZWZpbmVkLCBmb3IKQEAgLTI3NDMs
NiArMjc0OSwxMiBAQCBTWVNDQUxMX0RFRklORTUocHJjdGwsIGludCwgb3B0aW9uLCB1bnNpZ25l
ZCBsb25nLCBhcmcyLCB1bnNpZ25lZCBsb25nLCBhcmczLAogCWNhc2UgUFJfUklTQ1ZfVl9HRVRf
Q09OVFJPTDoKIAkJZXJyb3IgPSBSSVNDVl9WX0dFVF9DT05UUk9MKCk7CiAJCWJyZWFrOworCWNh
c2UgUFJfU0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTDoKKwkJZXJyb3IgPSBTRVRfTUVNT1JZ
X0NPTlNJU1RFTkNZX01PREVMKGFyZzIpOworCQlicmVhazsKKwljYXNlIFBSX0dFVF9NRU1PUllf
Q09OU0lTVEVOQ1lfTU9ERUw6CisJCWVycm9yID0gR0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RF
TCgpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQllcnJvciA9IC1FSU5WQUw7CiAJCWJyZWFrOwot
LSAKMi40MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
