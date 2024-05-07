Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C4BC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Aaf9WlBhrNeHwDWYz4FagiqRUwlsFs+Ht0moyZf6asY=; b=wB8i9WIu1kyBpFm/951Wo7wWBp
	CMb6inKLPnViyRbSKcuB98juiDBC4H2cLLvyc7i8yQG3TfrydY1QCL/o+rPaPQJ0ROBvh78PMkklN
	D82VTYyVjl2H0JBk42Ydo5tTEPFkV3fj2nX6vGEa3g4HbzuGKlz/uerJ6WkcwphVS3ehY3mCMW1sR
	l+Tz1ll89M7B+bEPSdsVfeWtivi99gAZciMCmm2bc25b8hp924dvUE5A5upPnQSjmgHt0cOQfXvHt
	Lh3LWaDdGKfCNcfROBtyId91ubFHJKTB7+mGK0CmiY1BfDkahpqJP6baNg7UDRnZ8PQ27vwfV2IN7
	v9p7xMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4N0j-0000000Bmx5-3CZh;
	Tue, 07 May 2024 15:45:45 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lqs-0000000BWC5-08wC
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:31:42 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7dad81110cfso175968139f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715092287; x=1715697087; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52KNTDLC+obpAk96hd5D+rzNIt3oW/ikIeIzud7iogo=;
        b=HhQprltZZQdAtfFllJwZZr2qlZBUg3ggrlpZoIlGOmVD9wiallKCNolRB2H5hY+ptd
         SnAszC1adoS6S22CJlFSclOGVtJ5oMK9JC1Z3nPVBh4wYoAl6EAlnqJIUfm6CA+hm5AN
         0tCkfIpPYbIY978bEskEJvx88Mwv8GVtBvgurXK31L8oWil9MBopdNtk4mWP/W9niO87
         mwjpt4HMWgRZlT8mT6WX2bmjp+G8NDpMPnNkMlb83mGnBiUhrI5rZ/SfPDLN2De5gUpd
         v+96N+4Hgmi0VgdjtpPTueOUVdoM33Vp9LXEsIAusdOBlkrn5T6bOOF88230hsdb+HoP
         1trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092287; x=1715697087;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52KNTDLC+obpAk96hd5D+rzNIt3oW/ikIeIzud7iogo=;
        b=riiBA6coWCCoXZ94GOGdGXSoaopjLfQfj99YyIy77zqZgP9vOkc9odowWYPh8JzMTu
         zuwGRapi7+sDn7F87qnxei4hk+Ppgvb37EuKtECsxYVkpP6LSmgNHcd0Bha9zy0rPm89
         C539etCATr5XhsdHl4DoNBxjZi5IHMiaNknkOfR+OSpbUpNp/lUjx49GUfSaJ2xzHiIm
         nkyPF5OwqKrpBsKsK8AwDUbzqjg1HVrSJzhyB81oHKgzbVFq12jIX/b7RT37CTWSTcJv
         Gt0mda0zEL+QpxMvoiET1Oa56vMCuqP7NWqAL2z5zVTsDrrs+6YppffZDNr+lTBbzN+A
         WytA==
X-Forwarded-Encrypted: i=1; AJvYcCUIrUt917y5/T0LN2Vz2+kbAUAWOS1Sxl+wbVLagLmqkcNivH2NWQ/Dah41ZAY5mPHXwcdsGHP/H5pFZcQTMuhZinkLhictZFsyXDKV7f1W
X-Gm-Message-State: AOJu0Yz3KnyaWpAMIqysq2WBv5fAaa2xG4aHO0UUR9WePUJtEd5oRfPe
	zoRxD6dzdY6r+hlgrM63MQ4VueLXZ1EYq79cE0I8dS1TsoZ8QvSg8X3sAQOA2SCnHLRNTVDsArX
	ru6MC3GBCKLdS21x89j/KKiiQBbN/9EXF0s6/tg==
X-Google-Smtp-Source: AGHT+IEU8/ZDsdl/a7pEUPUlhakyqhjOEDxLMywsFoH1yLJG3Zk35gTxil1EaJWuOYewmxGhIrFPsYoBYaM/+RK6ekE=
X-Received: by 2002:a6b:ea02:0:b0:7e1:7d63:887 with SMTP id
 m2-20020a6bea02000000b007e17d630887mr3645808ioc.18.1715092287669; Tue, 07 May
 2024 07:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715072254.git.zong.li@sifive.com>
In-Reply-To: <cover.1715072254.git.zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 7 May 2024 22:31:16 +0800
Message-ID: <CANXhq0rmSpDrZji7de7iz4TSJ-6Fp6_e1ZagsGYRcHAo6n9THg@mail.gmail.com>
Subject: Re: [RFC 0/6] RISC-V IOMMU HPM and nested IOMMU support
To: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgg@ziepe.ca, kevin.tian@intel.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_073130_603990_F9FC8877 
X-CRM114-Status: GOOD (  14.89  )
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

T24gVHVlLCBNYXkgNywgMjAyNCBhdCAxMDowN+KAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBpbmNsdWRlcyBSSVNDLVYgSU9NTVUgaGFyZHdh
cmUgcGVyZm9ybWFuY2UgbW9uaXRvciBhbmQKPiBuZXN0ZWQgSU9NTVUgc3VwcG9ydC4gSXQgYWxz
byBpbnRyb2R1Y2VzIG9wZXJhdGlvbnMgZm9yIHRoZSBnLXN0YWdlCj4gdGFibGUsIHdoaWNoIGFy
ZSByZXF1aXJlZCBmb3IgbmVzdGVkIElPTU1VLgo+Cj4gVGhpcyBwYXRjaCBzZXQgaXMgaW1wbGVt
ZW50ZWQgb24gdG9wIG9mIHRoZSBSSVNDLVYgSU9NTVUgdjQgc2VyaWVzIFsxXSwKPiBhbmQgaXQg
d2lsbCBiZSBzdWJtaXR0ZWQgYXMgYW4gUkZDIHVudGlsIHRoZSBSSVNDLVYgSU9NTVUgaGFzIGJl
ZW4KPiBtZXJnZWQuIEFkZGl0aW9uYWxseSwgaXQgd2lsbCBiZSB1cGRhdGVkIGFzIG5lZWRlZCB3
aGVuIGEgbmV3IHZlcnNpb24KPiBvZiB0aGUgUklTQy1WIElPTU1VIHNlcmllcyBpcyBwb3N0ZWQu
Cj4KPiBbMV0gbGluazogaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51
eC1yaXNjdi8yMDI0LU1heS8wNTM3MDguaHRtbAo+Cj4gWm9uZyBMaSAoNik6Cj4gICBpb21tdS9y
aXNjdjogQWRkIFJJU0MtViBJT01NVSBQTVUgc3VwcG9ydAo+ICAgaW9tbXUvcmlzY3Y6IFN1cHBv
cnQgSFBNIGFuZCBpbnRlcnJ1cHQgaGFuZGxpbmcKPiAgIGlvbW11L3Jpc2N2OiBzdXBwb3J0IEdT
Q0lECj4gICBpb21tdS9yaXNjdjogc3VwcG9ydCBuZXN0ZWQgaW9tbXUgZm9yIGdldHRpbmcgaW9t
bXUgaGFyZHdhcmUKPiAgICAgaW5mb3JtYXRpb24KPiAgIGlvbW11L3Jpc2N2OiBzdXBwb3J0IG5l
c3RlZCBpb21tdSBmb3IgY3JlYXRpbmcgZG9tYWlucyBvd25lZCBieQo+ICAgICB1c2Vyc3BhY2UK
PiAgIGlvbW11L3Jpc2N2OiBzdXBwb3J0IG5lc3RlZCBpb21tdSBmb3IgZmx1c2hpbmcgY2FjaGUK
Pgo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlICAgICB8ICAgNCArLQo+ICBkcml2ZXJz
L2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaCB8ICAyMiArKwo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2
L2lvbW11LXBtdS5jICB8IDQ3NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJp
dmVycy9pb21tdS9yaXNjdi9pb21tdS5jICAgICAgfCA0ODEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmggICAgICB8ICAgOCArCj4g
IGluY2x1ZGUvdWFwaS9saW51eC9pb21tdWZkLmggICAgIHwgIDM5ICsrKwo+ICA2IGZpbGVzIGNo
YW5nZWQsIDEwMDIgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBtdS5jCj4KPiAtLQo+IDIuMTcuMQo+
CgpQbGVhc2UgZHJvcCB0aGlzIG9uZSwgSSBoYXZlIHJlc2VudCB0aGlzIHNlcmllcyBieSByZW1v
dmluZyB0aGUKJy0tdGhyZWFkPXNoYWRvdycgb3B0aW9uIGZyb20gZm9ybWF0LXBhdGNoLCBhcyBp
dCBjYXVzZXMgUkZDIDUzMjIKY29tcGxpYW5jZSBpc3N1ZXMsIGFuZCBhbHNvIGNvcnJlY3QgdGhl
IHN1YmplY3Qgb2YgdGhlIHNlcmllcy4KVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
