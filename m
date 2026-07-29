Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C682C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 22:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJlQSHINVGH0g/VFC2Yh9cZYNwoY+hVrMsBvcnRTulE=; b=bUy5UloUbql79y
	2iE4Lf0iwxW3ZS80Y+BWYaHiq2jqx1dakTHQHfNfzXPBYYFvpZt7fOUHTYSy4m6wPcjOkJemOWsEW
	uUQAJ4b+jy1puUTjY5b04VXgVwBtwAX2EqOWOTIXG8MGU0x/v+NNNbeJeHcdPPxBnNxTc8+ashPRq
	AN/x9vstY3HPT07ZgoIJBeqhLeDfm1hPETTk6Sofgz677DU5K3XnnycEukqGOvEWPXBrkCVXk7apa
	WUmgxuR2k9RYGqtsFplc10SqMaCHjrIrWxXteUNvrXfgEs2p10oqR9vmdghnR93S0OyvySCzfCLJ9
	Ku2uZlS4ZKRL4J+9jdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCqg-000000094KE-13YP;
	Wed, 29 Jul 2026 22:34:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCqe-000000094JS-1ufY
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 22:34:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cf27856f9cso16044155ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 15:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785364439; x=1785969239; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmJqv3LbtEXaKjjxddFIB/CCzuAW9BtsEymREcKNJvA=;
        b=qBN8Lad5xZVnWVRMSV74IKVCnNe8SR8LjokaLKYPovfY6AgpCynxcef7zfY7VHjYO4
         pyAIShH+cnUuRfIN+bW2vQlQP2aNWFsod3n83F8TDKo0wsUtW00hukc1gIBx6imu3TJ3
         aZLceKzxmd71coalvTX+vhUu2lPWvKPLTYkdeklPjQLXDifdNueW/mXM9T0dFSQcHM+J
         yXVdaM2BEWhOA3V9sdfHq0IW+8OOxnKyp906q8VvrDCZ83Up0gZ5dH++WITWrvLe3Okx
         osi5TOziiHV1oCjz6x60nd43We98iOQTV+poP/IOikK2+C9Hd5BBHmiy2INNWR7TYNpc
         c08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785364439; x=1785969239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XmJqv3LbtEXaKjjxddFIB/CCzuAW9BtsEymREcKNJvA=;
        b=Dy0sqQn1ZXItlIJmbbrkMUtyGEk7y4mujPnA82NtMaCbP9CogL2T1ivLg8uyS44cu2
         uvkh5Iee369IyjhhH9wMiD1qsKtP3bQ6dchmJZKJg1t5ICuR0+AT1kt5QPh7acA4sFwD
         B6UCQ2oKin1xUGR/iIB5NRz9lxvA4E5zBidWbPBhq6bFpc8QCjyKmv6lUb9fisGxOqv6
         okMSnMm4QbipuBpYQ8vE5lQZp1jbesJg6PiJ20KLBHzgAGvNQaC91ng7iVyeL7YzcLno
         rhfydRKOR+dbyZT3tdLz+i3tKnu0KWHwassqtl+viPA3QyZkFoJk1ompXb8vwwJ8ucSA
         A/4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1RRVuqlqGT7iUNkT5h3iDS8y8WdKPoY1upUKBRQq4jEgTMYM/fv6CTsxfzZ7lLtW2RFg6uzodej5lNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/2fiylYImnZ4daIQLKSvhxo3Q5CabcvaDmW1Wv43lfpN6y6fX
	ImEEmZCdDu0Eda3SSr8D3VUOZM3bOrHIZzQCIxFqdNZGHPOxF32ZVbwX
X-Gm-Gg: AR+sD11buLiZW3Ozl3EpVaW767n0YvY6sGT2yBy4fpsKBnhY6+gDyUTdO5fm/1RxSPF
	wuLAtGiL2dJzChhy8rX2sTy9h/3toEz4esyutyW6XgS87dCUv/Kc1gBLDxW9EyQUcDCysUHlvRF
	JxIxf/fB6krHTOXnouAmPQfVTMlWzye0OnWZ+nyVpFJo5ZyjgWizpZpqIdrOPB8PNja28L3u2i7
	M5dogA/X/a7IQ2OyCvG49A61C/tlOKvZpMl1cvbZQT+YUiEii64E3KBehcJ2SIosuYhAqbs+24s
	72XHJvmN3HatmEJ24ey/lWlkwyh1E4rrgLoyv/b6d3aO2aYMME6j8WDC9fP5edCg1E1tS3k0D2z
	CXwDz5BwtkNeSH1R625CPiqg6WlZjI0kC1CK68KpoX+OBKrzT71btSN5DLTbEVkoPkzPw4IqdVs
	0ey1JzifH05ZybCwS9io37aIBQIkbWzljODjCNIrqfvK3p8sK1cpswCE4bbkg=
X-Received: by 2002:a17:902:e888:b0:2ca:d151:383a with SMTP id d9443c01a7336-2d035c10f84mr2037815ad.20.1785364439062;
        Wed, 29 Jul 2026 15:33:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a468f7sm17125555ad.28.2026.07.29.15.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:33:58 -0700 (PDT)
Date: Thu, 30 Jul 2026 06:33:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: KVM: Reset the SBI extension when disable
 it
Message-ID: <amp_hOi78SGkPjAp@inochi.infowork>
References: <20260706021154.210289-1-inochiama@gmail.com>
 <20260706021154.210289-4-inochiama@gmail.com>
 <CAAhSdy3qnvWF1cdxJxnJxR9jf0_BUpKbauNAuJcY_AAVaJw9AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3qnvWF1cdxJxnJxR9jf0_BUpKbauNAuJcY_AAVaJw9AQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_153400_490009_D4DE4C67 
X-CRM114-Status: GOOD (  22.71  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMDE6MzI6NDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIEp1bCA2LCAyMDI2IGF0IDc6NDLigK9BTSBJbm9jaGkgQW1hb3RvIDxpbm9j
aGlhbWFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgU0JJIGV4dGVuc2lvbiB2YWxpZGF0
aW9uIGNhbGxiYWNrIGNhbiBvbmx5IGZpeCB0aGUgcGFyYW1ldGVyIGlmCj4gPiB0aGUgZXh0ZW5z
aW9uIGlzIGVuYWJsZWQuIEhvd2V2ZXIsIGlmIHRoZSBleHRlbnNpb24gaXMgZGlzYWJsZWQgYWZ0
ZXIKPiA+IG1vZGlmdHkgc29tZSBwYXJhbWV0ZXJzLCB0aGUgc3RhdGUgb2YgdGhlIGV4dGVuc2lv
biBpcyBzdGlsbCBicm9rZW4uCj4gPgo+ID4gUmVzZXQgdGhlIGV4dGVuc2lvbiB3aGVuIHRoZSBl
eHRlbmlvbiBpcyBkaXNhYmxlZCBzbyBpdCBjYW4gaGF2ZQo+IAo+IHMvZXh0ZW5pb24vZXh0ZW5z
aW9uLwo+IAo+ID4gYSBjbGVhciBjb250ZXh0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElub2No
aSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jIHwgMTAgKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gPiBpbmRleCBiNzM3ZTlhN2ExMmEuLjNlYjdi
N2M1NzA1OSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiA+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiA+IEBAIC0yMjEsNiArMjIxLDcgQEAgc3Rh
dGljIGludCByaXNjdl92Y3B1X3NldF9zYmlfZXh0X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250
ZXh0ID0gJnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBr
dm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqc2V4dDsKPiA+ICsgICAgICAgY29uc3Qgc3Ry
dWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmV4dDsKPiA+Cj4gPiAgICAgICAgIGlmIChyZWdf
dmFsICE9IDEgJiYgcmVnX3ZhbCAhPSAwKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ID4gQEAgLTIyOSw2ICsyMzAsMTUgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X3NldF9z
YmlfZXh0X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiAgICAgICAgIGlmICghc2V4
dCB8fCBzY29udGV4dC0+ZXh0X3N0YXR1c1tzZXh0LT5leHRfaWR4XSA9PSBLVk1fUklTQ1ZfU0JJ
X0VYVF9TVEFUVVNfVU5BVkFJTEFCTEUpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7Cj4gPgo+ID4gKyAgICAgICBleHQgPSBzZXh0LT5leHRfcHRyOwo+ID4gKwo+ID4gKyAgICAg
ICBpZiAoIXJlZ192YWwgJiYgc2NvbnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0g
S1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQpIHsKPiA+ICsgICAgICAgICAgICAgICBp
ZiAoZXh0LT5yZXNldCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZXh0LT5yZXNldCh2
Y3B1KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0g
dHJ1ZTsKPiAKPiBMZXQncyBub3QgYmxpbmRseSBzZXQgImNzcl9kaXJ0eSIgd2hlbiBhbnkgU0JJ
IGV4dGVuc2lvbiBpcyBkaXNhYmxlZCwKPiBpbnN0ZWFkIHdlIHNob3VsZCBzZXQgImNzcl9kaXJ0
cnkiIGluIGt2bV9zYmlfZXh0X2Z3ZnRfcmVzZXQoKSAoanVzdAo+IGxpa2Ugd2UgZG8gaW4ga3Zt
X3NiaV9leHRfZndmdF9zZXRfcmVnKCkpLgo+IAoKR29vZCwgSSB3aWxsIG1vdmUgdGhpcyBsaW5l
IHRvIHRoZSBrdm1fc2JpX2V4dF9md2Z0X3Jlc2V0KCkgaW4gdGhlIG5ldyB2ZXJzaW9uLgoKPiA+
ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICAgICAgICAgc2NvbnRl
eHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPSAocmVnX3ZhbCkgPwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQgOgo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0RJU0FCTEVEOwo+
ID4gLS0KPiA+IDIuNTUuMAo+ID4KPiAKPiBSZWdhcmRzLAo+IEFudXAKPiAKClJlZ2FyZHMsCklu
b2NoaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
