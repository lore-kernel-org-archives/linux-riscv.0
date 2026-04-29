Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BE9FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEZWY0O+7ycbhNc/WQcRRCD6ig8B4jCgapwWdjpmlcg=; b=F4rNfbvxjkDOKp
	mbuU/jiZpi8wjY1WV28qxCYFxkSOPXKd4tHru3G2xe1ywwdnoLiviOo0NcJZ0C07dXzhKZXrXNdWe
	A69C8DyQvdM1buwZjK0NHoV+7O8bSPCVCNeZYLEH7z4B0VakJ1/LPDbvdnnZEarg0C8Of24ZPlHIb
	E+eRtZZllx0wt4WccC9nSqlu6PsX7dUFKhzC36X4A47RfVG+gDDqPP5OLcyaP7XMUW2kRGJVinLoM
	HEluQEkOeiONarySuPXRXcmw1XLzHD0HD0hPaTw8fC/SBn/J2/YGVAzaTlAWxw8r0hSoNc8+MO/26
	gyZkU8gWEdYNEZcM5jEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHu0D-00000002kDk-06Oj;
	Wed, 29 Apr 2026 01:46:13 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHu09-00000002kD8-3F2J;
	Wed, 29 Apr 2026 01:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777427166; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=0ABfuJZF6yh/Y+/JJ98VtxHR90cMCDZPqGB01IOmkmo=;
	b=O5i8o42+diFzGhMvpB64PKujCuoXOEaVYENPLKmW3H+VKdJ3FJbV2U1TuinbdhM/YzJWtNQwTCo5yrWm5XvUA7k+3fC+JTYmL8+Z6DD8fRY/1NFXoT44BI6tMBau2bTwRUi1R2sRu2OXHPqoHp/7gg4GO0/AY5RRoD1y8y/N2kk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X1vuOY6_1777427161;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1vuOY6_1777427161 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 09:46:02 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [RFC PATCH 08/11] iommu/riscv: Add dirty tracking support for second-stage domains 
Date: Wed, 29 Apr 2026 09:46:00 +0800
Message-Id: <20260429014600.67055-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428133800.GG849557@ziepe.ca>
References: <20260428133800.GG849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_184610_010366_B2ED4A14 
X-CRM114-Status: GOOD (  11.58  )
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

Pj4gQEAgLTEyNDcsNiArMTI0Nyw4NCBAQCBzdGF0aWMgaW50IHJpc2N2X2lvbW11X2F0dGFjaF9w
YWdpbmdfZG9tYWluKHN0cnVjdCBpb21tdV9kb21haW4gKmlvbW11X2RvbWFpbiwKPj4gIAlyZXR1
cm4gMDsKPj4gIH0KPj4gIAo+PiArLyoKPj4gKyAqIEVuYWJsZSBvciBkaXNhYmxlIGhhcmR3YXJl
IEEvRCBiaXQgdXBkYXRlcyAoR0FERSkgaW4gdGhlIGRldmljZSBjb250ZXh0IGZvcgo+PiArICog
YWxsIGRldmljZXMgYXR0YWNoZWQgdG8gYSBzZWNvbmQtc3RhZ2UgZG9tYWluLiBXaGVuIGRpcnR5
IHRyYWNraW5nIGlzCj4+ICsgKiBlbmFibGVkIHRoZSBJT01NVSBoYXJkd2FyZSB3aWxsIHNldCB0
aGUgZGlydHkgYml0IGluIFBURXMgb24gd3JpdGUgYWNjZXNzLAo+PiArICogbWFraW5nIHRoZW0g
dmlzaWJsZSB0byByZWFkX2FuZF9jbGVhcl9kaXJ0eSgpLgo+PiArICovCj4+ICtzdGF0aWMgaW50
IHJpc2N2X2lvbW11X3NldF9kaXJ0eV90cmFja2luZyhzdHJ1Y3QgaW9tbXVfZG9tYWluICppb21t
dV9kb21haW4sCj4+ICsJCQkJCSAgYm9vbCBlbmFibGUpCj4+ICt7Cj4+ICsJc3RydWN0IHJpc2N2
X2lvbW11X2RvbWFpbiAqZG9tYWluID0gaW9tbXVfZG9tYWluX3RvX3Jpc2N2KGlvbW11X2RvbWFp
bik7Cj4+ICsJc3RydWN0IHJpc2N2X2lvbW11X2JvbmQgKmJvbmQ7Cj4+ICsJc3RydWN0IHJpc2N2
X2lvbW11X2RldmljZSAqaW9tbXUsICpwcmV2Owo+PiArCXN0cnVjdCByaXNjdl9pb21tdV9kYyAq
ZGM7Cj4+ICsJc3RydWN0IGlvbW11X2Z3c3BlYyAqZndzcGVjOwo+PiArCXN0cnVjdCByaXNjdl9p
b21tdV9jb21tYW5kIGNtZDsKPj4gKwl1NjQgdGM7Cj4+ICsJaW50IGk7Cj4+ICsKPj4gKwlyY3Vf
cmVhZF9sb2NrKCk7Cj4+ICsKPj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShib25kLCAmZG9t
YWluLT5ib25kcywgbGlzdCkgewo+PiArCQlpb21tdSA9IGRldl90b19pb21tdShib25kLT5kZXYp
Owo+PiArCQlmd3NwZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldChib25kLT5kZXYpOwo+PiArCj4+
ICsJCWZvciAoaSA9IDA7IGkgPCBmd3NwZWMtPm51bV9pZHM7IGkrKykgewo+PiArCQkJZGMgPSBy
aXNjdl9pb21tdV9nZXRfZGMoaW9tbXUsIGZ3c3BlYy0+aWRzW2ldKTsKPj4gKwkJCXRjID0gUkVB
RF9PTkNFKGRjLT50Yyk7Cj4+ICsJCQlpZiAoISh0YyAmIFJJU0NWX0lPTU1VX0RDX1RDX1YpKQo+
PiArCQkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCQlpZiAoZW5hYmxlKQo+PiArCQkJCXRjIHw9IFJJ
U0NWX0lPTU1VX0RDX1RDX0dBREU7Cj4+ICsJCQllbHNlCj4+ICsJCQkJdGMgJj0gflJJU0NWX0lP
TU1VX0RDX1RDX0dBREU7Cj4+ICsJCQlXUklURV9PTkNFKGRjLT50YywgdGMpOwo+Cj5JJ20gcHJl
dHR5IHN1cmUgeW91IGRvbid0IG5lZWQgdG8gZG8gdGhpcy4gSnVzdCBwcmVzZXQgR0FERSB3aGVu
IGV2ZXIKPmEgUzIgZG9tYWluIGlzIGF0dGFjaGVkLCByZWx5IG9uIHRoZSBwcmUtc2V0IEQgdG8g
YXZvaWQgYW55IEhXIGNvc3QKPmFuZCB5b3UgYXJlIGZpbmUuIE5vIG5lZWQgdG8gY2hhbmdlIGl0
IGR5bmFtaWNhbGx5IHVubGVzcyBzb21ldGhpbmcgaXMKPnJlYWxsIHdlaXJkIGFib3V0IHJpc2N2
Lgo+CgpUaGFua3MsIHRoYXTigJlzIGEgZ29vZCBzdWdnZXN0aW9uLiBJIHdpbGwgZm9sbG93IHRo
YXQgYXBwcm9hY2g6IHByZXNldCBHQURFCm9uIHNlY29uZC1zdGFnZSBkb21haW4gYXR0YWNoIGFu
ZCByZWx5IG9uIHRoZSBjb3JlLW1hbmFnZWQgRC1iaXQgYmVoYXZpb3IuCgpGYW5neXUKCj5KYXNv
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
