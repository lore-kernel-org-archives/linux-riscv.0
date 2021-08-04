Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31887C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF32160EE7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF32160EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Hz0Q2l7RQirgQGb3PsrhQ0RQ/N21vY7JnWenwa/NMC4=; b=I2FZ4khihB8Gu/6Cq6KFxTpbiY
	Ab//Gkl6yCiUC8nN77z8OZNjOEF9GLVjLWk+hUBpcnfr9JLsIaWs1PGmF1hlmzXlXRCaIfb0zd/F9
	nBNlIBYWPYy5hEfivWZQNIMuECmMlQwEgLbzYx723tPok6lR/ng3fjqfMQ0bmzlUF8gNoySLmjLJ0
	pTUBsxO1JnqLbrksPqdXzGamsuRdJ4qQZHxLxZMxEZ3kNgFLW34/9E5XDn6b/StCt3zWnFfrCZaa8
	cVPzHwrOWEq8TdtyFTe4ayF7BIFW9OB9hRgft29lP1SzpYJLGYn2iH8Qbf0wM1UBAAj6H5r+owMUm
	qsbu1rHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB8Qk-004kY9-TA; Wed, 04 Aug 2021 04:22:58 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB8Qi-004kXc-Ad
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 04:22:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so7032120pjs.0
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=i04VfYofLYKCIG1Z6skleSNL7OKcr09RxkFflI43t/Q=;
 b=mwMdGF9iwdQXOz5cWezZNFZBuH4MXIGpo34e3rrYRHna/vjpbhQx3tVW1NW4f261zr
 5vIvDizIhY/Jp2BgVohOgBKcU8FrOZEBkTlVmOKO7eQLyx5zRR1CabdK2wvzJs42RBqK
 2KZQsI0kHFjZ4BEgpWqgavfLQxWCBA6mHC0Ol1IiepsnsnACKXQgdXNmoNS/s/t3CzGp
 pqk6zeCviLcPHWek6b/UOGJfmXX27pHNLC/ynz5sP2cADVhpyKbCqbO2mSKF6nfWdtMp
 B2fYxmee1mJGwZJUGQApJF10lhozDLK7uiI8UopN1RVr2VxE0imPvvXO+/8gLfJwzh/q
 N/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=i04VfYofLYKCIG1Z6skleSNL7OKcr09RxkFflI43t/Q=;
 b=YXHCpnBX3Z8Kgd3BEE22dvKqo1/hqxST0ITG/0jDiy9WCkUPWI0zYbv9KUdHSTS4/E
 My8zDaIiFUPWJ0JBV4x4B9mJobrhxPWIVyJvHpn5YkWwCnwWulhjWPdDCT7YwKmPRPqj
 ix+olBgVAZevquQWIJHrHlRXYSY98W/IKUtoOs9voTSd7Aj0JXExxOlWfFqO62a2YmFN
 HmnNp6Slfq3iZ9sGaRyIoi4ysFQUiaTC13LU7Ld/AQ0WI8lixweOw6JcB+mSgg7WxP31
 2880tlOBaCmGebGbVf/H+wasvGACMWmJIuV78SKlUyzXI3DWKEaC2qL98BfFOCbxJK3t
 6AOg==
X-Gm-Message-State: AOAM532CyVIuvujQUXmTy9GsQ4Xzq8bKlcsUfJ/jJQrwvfpogh6XRAKq
 kwgUgu8WkAKqQY3O+8A0JTo35Pxl6r79vQ==
X-Google-Smtp-Source: ABdhPJz2rvddHcEo28ed9rl2wL1JFcrDn7cljKcQ4AfRhN3PpF0qgvY/h2xt6pHPI7PasNsMKcBtSA==
X-Received: by 2002:a62:e714:0:b029:3c4:8544:b2b7 with SMTP id
 s20-20020a62e7140000b02903c48544b2b7mr4265679pfh.5.1628050974761; 
 Tue, 03 Aug 2021 21:22:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q2sm816324pfu.205.2021.08.03.21.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 21:22:54 -0700 (PDT)
Date: Tue, 03 Aug 2021 21:22:54 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Aug 2021 21:22:49 PDT (-0700)
Subject: Re: [PATCH 1/4] tools/perf/arch/riscv: record registers needed for
 --call-graph=dwarf
In-Reply-To: <20210705232524.4024832-2-edwin@etorok.net>
CC: linux-riscv@lists.infradead.org, edwin@etorok.net, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, jolsa@redhat.com, namhyung@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-perf-users@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: edwin@etorok.net
Message-ID: <mhng-3ff979c8-3e24-48a4-8a22-8aa3f14f42ac@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_212256_418700_2F29F28D 
X-CRM114-Status: GOOD (  23.24  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwNSBKdWwgMjAyMSAxNjoyNToyMSBQRFQgKC0wNzAwKSwgZWR3aW5AZXRvcm9rLm5l
dCB3cm90ZToKPiBGb3IgbGliZHctYmFzZWQgY2FsbGdyYXBoIHNhbXBsaW5nIHRvIHdvcmsgd2Ug
bmVlZCB0byBzYW1wbGUgcmVnaXN0ZXJzLgo+Cj4gVGVzdGVkIG9uIEhpRml2ZSBVbm1hdGNoZWQg
d2l0aCBhIHRydW5rIHZlcnNpb24gb2YgT0NhbWw6CgpUaGVzZSBnZW5lcmFsbHkgTEdUTSwgYnV0
IEkgZG9uJ3QgaGF2ZSBwYXRjaCAjMi4gIFNvbWV0aW1lcyB0aGF0IG1lYW5zIAp0aGV5J3JlIGp1
c3Qgbm90IHRhcmdldGVkIGF0IHRoZSBSSVNDLVYgdHJlZSwgd2hpY2ggaXMgZmluZSB3aXRoIG1l
IGJ1dCAKSSdtIGhhcHB5IHRvIHRha2Ugc29tZSB0aW1lIHRvIGxvb2sgY2xvc2VyIGFuZCB0YWtl
IHRoZW0gaWYgdGhhdCdzIHdoYXQgCnlvdSdyZSBsb29raW5nIGZvci4KCkEgY292ZXIgbGV0dGVy
IGNhbiBiZSBhIGdvb2QgYmV0LCB0byBkZXNjcmliZSB0aGlzIHNvcnQgb2Ygc3R1ZmYuCgo+IGBg
YAo+ICAjIHBlcmYgcmVjb3JkIC0tdXNlci1yZWdzPT8KPiBhdmFpbGFibGUgcmVnaXN0ZXJzOiBw
YyByYSBzcCBncCB0cCB0MCB0MSB0MiBzMCBzMSBhMCBhMSBhMiBhMyBhNCBhNSBhNiBhNwo+ICBz
MiBzMyBzNCBzNSBzNiBzNyBzOCBzOSBzMTAgczExIHQzIHQ0IHQ1IHQ2Cj4KPiAgIyBzZWQgLWUg
J3MvKFwqXCovLycgLWUgJ3MvXCpcKikvLycgXAo+IHRlc3RzdWl0ZS90ZXN0cy9taXNjLXVuc2Fm
ZS9hbG1hYmVuY2gubWwgPmFsbWFiZW5jaF9iZW5jaG1hcmsubWwKPiAgIyBvY2FtbG9wdCBhbG1h
YmVuY2hfYmVuY2htYXJrLm1sIC11bnNhZmUgLW8gYWxtYWJlbmNoX2JlbmNobWFyawo+ICAjIHBl
cmYgcmVjb3JkIC1lIGNwdS1jbG9jayAtdiAtLWNhbGwtZ3JhcGg9ZHdhcmYgLUYgOTkgXAo+IC4v
YWxtYWJlbmNoX2JlbmNobWFyawo+Cj4gY2FsbGNoYWluOiB0eXBlIERXQVJGCj4gY2FsbGNoYWlu
OiBzdGFjayBkdW1wIHNpemUgODE5Mgo+IG5yX2NibG9ja3M6IDAKPiBhZmZpbml0eTogU1lTCj4g
bW1hcCBmbHVzaDogMQo+IGNvbXAgbGV2ZWw6IDAKPiBtbWFwIHNpemUgNTI4Mzg0Qgo+IG1tYXAg
c2l6ZSA1MjgzODRCCj4gQ29udHJvbCBkZXNjcmlwdG9yIGlzIG5vdCBpbml0aWFsaXplZAo+IDAg
MTcuMDAgLTI2LjA2Cj4gMSAxMi4zNCAxLjI5Cj4gMiA2LjgzIDIyLjk1Cj4gMyAwLjA0IC0xLjI2
Cj4gNCAyLjMwIDEyLjU0Cj4gNSAyLjkzIDE0LjM1Cj4gNiAyMS4yNyAtMTYuNTcKPiA3IDIwLjQx
IC0xOS4wNAo+IFsgcGVyZiByZWNvcmQ6IFdva2VuIHVwIDY1IHRpbWVzIHRvIHdyaXRlIGRhdGEg
XQo+IExvb2tpbmcgYXQgdGhlIHZtbGludXhfcGF0aCAoOCBlbnRyaWVzIGxvbmcpCj4gRmFpbGVk
IHRvIG9wZW4gL3Byb2Mva2NvcmUuCj4gTm90ZSAvcHJvYy9rY29yZSByZXF1aXJlcyBDQVBfU1lT
X1JBV0lPIGNhcGFiaWxpdHkgdG8gYWNjZXNzLgo+IFVzaW5nIC9wcm9jL2thbGxzeW1zIGZvciBz
eW1ib2xzCj4gZmFpbGVkIHRvIHdyaXRlIGZlYXR1cmUgQ1BVREVTQwo+IGZhaWxlZCB0byB3cml0
ZSBmZWF0dXJlIENQVUlECj4gZmFpbGVkIHRvIHdyaXRlIGZlYXR1cmUgTlVNQV9UT1BPTE9HWQo+
IGZhaWxlZCB0byB3cml0ZSBmZWF0dXJlIE1FTV9UT1BPTE9HWQo+IFsgcGVyZiByZWNvcmQ6IENh
cHR1cmVkIGFuZCB3cm90ZSAxNi4yNjUgTUIgcGVyZi5kYXRhICgxOTk3IHNhbXBsZXMpIF0KPgo+
ICAjIHBlcmYgc2NyaXB0Cj4gLi4uCj4gYWxtYWJlbmNoX2JlbmNoICAxMTkzIDE0ODE2LjM5OTIz
NTogICAxMDEwMTAxMCBjcHUtY2xvY2s6Cj4gIDNmYmJkNjNkNTQgcmVkdWNlX3NpbmNvcysweDI2
OCAoaW5saW5lZCkKPiAgM2ZiYmQ2M2Q1NCBfX2NvcysweDI2OCAoL2xpYi9saWJtLTIuMzMuc28p
Cj4gIDJhYWM0YjI2MWIgQWxtYWJlbmNoX2JlbmNobWFyay5wbGFuZXRwdisweDI1Zgo+ICAgICAo
L2hvbWUvcm9vdC9vY2FtbC9hbG1hYmVuY2hfYmVuY2htYXJrKQo+ICAyYWFjNGIzZTAzIEFsbWFi
ZW5jaF9iZW5jaG1hcmsuZW50cnkrMHgxMmJiCj4gICAgICgvaG9tZS9yb290L29jYW1sL2FsbWFi
ZW5jaF9iZW5jaG1hcmspCj4gIDJhYWM0YjAwOTcgY2FtbF9wcm9ncmFtKzB4MTQzCj4gICAgICgv
aG9tZS9yb290L29jYW1sL2FsbWFiZW5jaF9iZW5jaG1hcmspCj4gIDJhYWM0ZTRlM2QgY2FtbF9z
dGFydF9wcm9ncmFtKzB4NzEKPiAgICAgKC9ob21lL3Jvb3Qvb2NhbWwvYWxtYWJlbmNoX2JlbmNo
bWFyaykKPiAgMmFhYzRlNTQwOSBjYW1sX3N0YXJ0dXBfY29tbW9uKzB4MThmCj4gICAgICgvaG9t
ZS9yb290L29jYW1sL2FsbWFiZW5jaF9iZW5jaG1hcmspCj4gIDJhYWM0ZTU0NjUgY2FtbF9zdGFy
dHVwX2V4bisweDkgKGlubGluZWQpCj4gIDJhYWM0ZTU0NjUgY2FtbF9zdGFydHVwKzB4OSAoaW5s
aW5lZCkKPiAgMmFhYzRlNTQ2NSBjYW1sX21haW4rMHg5Cj4gICAgICgvaG9tZS9yb290L29jYW1s
L2FsbWFiZW5jaF9iZW5jaG1hcmspCj4gIDJhYWM0YWZlODkgbWFpbisweDkKPiAgICAgKC9ob21l
L3Jvb3Qvb2NhbWwvYWxtYWJlbmNoX2JlbmNobWFyaykKPiAgM2ZiYmM0N2IwYiBfX2xpYmNfc3Rh
cnRfbWFpbisweDg1ICgvbGliL2xpYmMtMi4zMy5zbykKPiAgMmFhYzRhZmViYiBfc3RhcnQrMHgy
YiAoL2hvbWUvcm9vdC9vY2FtbC9hbG1hYmVuY2hfYmVuY2htYXJrKQo+IGBgYAo+Cj4gQ2M6IFBl
dGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiBDYzogSW5nbyBNb2xuYXIgPG1p
bmdvQHJlZGhhdC5jb20+Cj4gQ2M6IEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUBrZXJu
ZWwub3JnPgo+IENjOiBKaXJpIE9sc2EgPGpvbHNhQHJlZGhhdC5jb20+Cj4gQ2M6IE5hbWh5dW5n
IEtpbSA8bmFtaHl1bmdAa2VybmVsLm9yZz4KPiBDYzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxt
c2xleUBzaWZpdmUuY29tPgo+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29t
Pgo+IENjOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KPiBDYzogbGludXgtcGVy
Zi11c2Vyc0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkd2luQGV0b3Jvay5uZXQ+Cj4g
LS0tCj4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL3BlcmZfcmVncy5jIHwgMzIgKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9wZXJmX3JlZ3MuYyBi
L3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL3BlcmZfcmVncy5jCj4gaW5kZXggMjg2NGUyZTM3
NzZkLi44YzlmNTExZTgzMjIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0
aWwvcGVyZl9yZWdzLmMKPiArKysgYi90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9wZXJmX3Jl
Z3MuYwo+IEBAIC0yLDUgKzIsMzcgQEAKPiAgI2luY2x1ZGUgIi4uLy4uL3V0aWwvcGVyZl9yZWdz
LmgiCj4KPiAgY29uc3Qgc3RydWN0IHNhbXBsZV9yZWcgc2FtcGxlX3JlZ19tYXNrc1tdID0gewo+
ICsJU01QTF9SRUcocGMsIFBFUkZfUkVHX1JJU0NWX1BDKSwKPiArCVNNUExfUkVHKHJhLCBQRVJG
X1JFR19SSVNDVl9SQSksCj4gKwlTTVBMX1JFRyhzcCwgUEVSRl9SRUdfUklTQ1ZfU1ApLAo+ICsJ
U01QTF9SRUcoZ3AsIFBFUkZfUkVHX1JJU0NWX0dQKSwKPiArCVNNUExfUkVHKHRwLCBQRVJGX1JF
R19SSVNDVl9UUCksCj4gKwlTTVBMX1JFRyh0MCwgUEVSRl9SRUdfUklTQ1ZfVDApLAo+ICsJU01Q
TF9SRUcodDEsIFBFUkZfUkVHX1JJU0NWX1QxKSwKPiArCVNNUExfUkVHKHQyLCBQRVJGX1JFR19S
SVNDVl9UMiksCj4gKwlTTVBMX1JFRyhzMCwgUEVSRl9SRUdfUklTQ1ZfUzApLAo+ICsJU01QTF9S
RUcoczEsIFBFUkZfUkVHX1JJU0NWX1MxKSwKPiArCVNNUExfUkVHKGEwLCBQRVJGX1JFR19SSVND
Vl9BMCksCj4gKwlTTVBMX1JFRyhhMSwgUEVSRl9SRUdfUklTQ1ZfQTEpLAo+ICsJU01QTF9SRUco
YTIsIFBFUkZfUkVHX1JJU0NWX0EyKSwKPiArCVNNUExfUkVHKGEzLCBQRVJGX1JFR19SSVNDVl9B
MyksCj4gKwlTTVBMX1JFRyhhNCwgUEVSRl9SRUdfUklTQ1ZfQTQpLAo+ICsJU01QTF9SRUcoYTUs
IFBFUkZfUkVHX1JJU0NWX0E1KSwKPiArCVNNUExfUkVHKGE2LCBQRVJGX1JFR19SSVNDVl9BNiks
Cj4gKwlTTVBMX1JFRyhhNywgUEVSRl9SRUdfUklTQ1ZfQTcpLAo+ICsJU01QTF9SRUcoczIsIFBF
UkZfUkVHX1JJU0NWX1MyKSwKPiArCVNNUExfUkVHKHMzLCBQRVJGX1JFR19SSVNDVl9TMyksCj4g
KwlTTVBMX1JFRyhzNCwgUEVSRl9SRUdfUklTQ1ZfUzQpLAo+ICsJU01QTF9SRUcoczUsIFBFUkZf
UkVHX1JJU0NWX1M1KSwKPiArCVNNUExfUkVHKHM2LCBQRVJGX1JFR19SSVNDVl9TNiksCj4gKwlT
TVBMX1JFRyhzNywgUEVSRl9SRUdfUklTQ1ZfUzcpLAo+ICsJU01QTF9SRUcoczgsIFBFUkZfUkVH
X1JJU0NWX1M4KSwKPiArCVNNUExfUkVHKHM5LCBQRVJGX1JFR19SSVNDVl9TOSksCj4gKwlTTVBM
X1JFRyhzMTAsIFBFUkZfUkVHX1JJU0NWX1MxMCksCj4gKwlTTVBMX1JFRyhzMTEsIFBFUkZfUkVH
X1JJU0NWX1MxMSksCj4gKwlTTVBMX1JFRyh0MywgUEVSRl9SRUdfUklTQ1ZfVDMpLAo+ICsJU01Q
TF9SRUcodDQsIFBFUkZfUkVHX1JJU0NWX1Q0KSwKPiArCVNNUExfUkVHKHQ1LCBQRVJGX1JFR19S
SVNDVl9UNSksCj4gKwlTTVBMX1JFRyh0NiwgUEVSRl9SRUdfUklTQ1ZfVDYpLAo+ICAJU01QTF9S
RUdfRU5ECj4gIH07CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
