Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA66CE9E2F8
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzcCI6i9hm5rRlUS3//oilxyqCZ1aHakzS373ldZwwM=; b=AJ/6SESdd4ozQS
	TRgUi/+pmyPVq442DFj7jQZJwqzONepBsAUtA+P5MHQkViFgyyJ5aVhTnsBmovRg86NgvcBPjForr
	kEyL36kpSm7dJDFCbYAv3Wv5cSnh17PCcjTXIN4Ru0KCk93DuMUsBK2lgPLh0kzhkBOHoynXOqPhy
	rid7tAgvTNQYggunRnJn026T+QTJQPdpMSRo+9vBG1+R+RTlRmZLKKiyp1TZP2OTZfUW/9a3jg3Ch
	8VXZrNG+D011nKoZvMdBkSu9mZBtUnJo2SuGRArwRbUS6Zg3OfqXsL6zpAsli24F0S2K2TJPa+z7a
	hHvfPE+foVksqPHaqX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq90C-00000000bHn-34DX;
	Wed, 11 Feb 2026 12:07:28 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq908-00000000bHT-3s5l
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 12:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770811635; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=F/xti1QAvF9cEi5hXsm9eD/PRlUwjRYPQBfR6jIjJ0o=;
	b=nqV6Bvj7/yOU5Ikcj9op5IfxGcL3GP7rZY0oYq/vqGZoRCePkcABdYsD+0iBj+d08nar8r0d+llDPH4Wwq11ROyYSdxPKOOG6xSPrSqaBkGWW/xkxbXiIuszBy8AyKx+0gvqEEl5661ShCdELy6T9Mv/r3M6ryf7yy69erTgV9Y=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wz13zdh_1770811631 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Feb 2026 20:07:13 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	will@kernel.org
Subject: Re: Re: [PATCH 0/2] iommu/riscv: support range and non-leaf IOTLB invalidation 
Date: Wed, 11 Feb 2026 20:07:09 +0800
Message-Id: <20260211120709.51070-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260210130221.GE943673@ziepe.ca>
References: <20260210130221.GE943673@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_040725_652477_364896B2 
X-CRM114-Status: UNSURE (   8.84  )
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

Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IFRo
aXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdHdvIFJJU0MtViBJT01NVSB2MS4wLjEgaW52YWxp
ZGF0aW9uIGV4dGVuc2lvbnMgaW4KPj4gdGhlIFJJU0MtViBJT01NVSBkcml2ZXI6Cj4+Cj4+ICAg
LSBBZGRyZXNzIFJhbmdlIEludmFsaWRhdGlvbiAoY2FwYWJpbGl0aWVzLlMpLCB3aGljaCBhbGxv
d3MgZW5jb2RpbmcgYSBOQVBPVAo+PiAgICAgYWRkcmVzcyByYW5nZSBpbiB0aGUgSU9USU5WQUwu
e1ZNQSxHVk1BfSBBRERSIG9wZXJhbmQgd2hlbiB0aGUgUyBiaXQgaXMgc2V0LAo+PiAgICAgcmVk
dWNpbmcgdGhlIG51bWJlciBvZiBpbnZhbGlkYXRpb24gY29tbWFuZHMgZm9yIGxhcmdlIG9yIHN1
cGVycGFnZS1iYWNrZWQKPj4gICAgIG1hcHBpbmdzLgo+Pgo+PiAgIC0gTm9uLWxlYWYgUFRFIElu
dmFsaWRhdGlvbiAoY2FwYWJpbGl0aWVzLk5MKSwgd2hpY2ggYWxsb3dzIElPVElOVkFMLlZNQSB3
aXRoCj4+ICAgICBBVj0xIGFuZCBOTD0xIHRvIGludmFsaWRhdGUgY2FjaGVkIG5vbi1sZWFmIFBU
RSBpbmZvcm1hdGlvbiBmb3IgdGhlIGdpdmVuCj4+ICAgICBJT1ZBLCBhZGRyZXNzaW5nIGNhc2Vz
IHdoZXJlIHVwZGF0aW5nIG1hcHBpbmdzIHJlcGxhY2VzIGEgbm9uLWxlYWYgZW50cnkuCj4+Cj4+
IFBhdGNoIDEgaW50cm9kdWNlcyB0aGUgbWlzc2luZyBjYXBhYmlsaXR5L29wZXJhbmQgZGVmaW5p
dGlvbnMgYW5kIHN3aXRjaGVzIHRoZQo+PiBJT1RMQiBpbnZhbGlkYXRpb24gcGF0aCB0byB1c2Ug
TkFQT1QgcmFuZ2UgaW52YWxpZGF0aW9ucyB3aGVuIHN1cHBvcnRlZC4KPj4KPj4gUGF0Y2ggMiBh
ZGRzIHRoZSBOTCBjYXBhYmlsaXR5L29wZXJhbmQgZGVmaW5pdGlvbnMgYW5kIGV4dGVuZHMgdGhl
IGludmFsaWRhdGlvbgo+PiBwYXRoIHRvIG9wdGlvbmFsbHkgcmVxdWVzdCBub24tbGVhZiBpbnZh
bGlkYXRpb24uIFdoZW4gbWFwX3BhZ2VzKCkgcmVwbGFjZXMKPj4gbm9uLWxlYWYgcGFnZS10YWJs
ZSBlbnRyaWVzLCB0aGUgZHJpdmVyIGludmFsaWRhdGVzIHRoZSBhZmZlY3RlZCBJT1ZBIHJhbmdl
IHdpdGgKPj4gbm9uLWxlYWYgc2VtYW50aWNzLgo+Pgo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZXMg
YXJlIGV4cGVjdGVkIG9uIGhhcmR3YXJlIHRoYXQgZG9lcyBub3QgYWR2ZXJ0aXNlIHRoZXNlCj4+
IGNhcGFiaWxpdGllczsgdGhlIGRyaXZlciBjb250aW51ZXMgdG8gZmFsbCBiYWNrIHRvIHRoZSBl
eGlzdGluZyBpbnZhbGlkYXRpb24KPj4gYmVoYXZpb3IuCj4+Cj4+IEZhbmd5dSBZdSAoMik6Cj4+
ICAgaW9tbXUvcmlzY3Y6IEFkZCBOQVBPVCByYW5nZSBpbnZhbGlkYXRpb24gc3VwcG9ydCBmb3Ig
SU9USU5WQUwKPj4gICBpb21tdS9yaXNjdjogQWRkIG5vbi1sZWFmIGludmFsaWRhdGlvbiBzdXBw
b3J0Cj4KPlRoZXNlIHdpbGwgbmVlZCB0byBiZSByZWRvbmUgb24gdG9wIG9mIHRoZSBuZXcgcGFn
ZSB0YWJsZSBjb2RlIGZvciByaXNjdjoKPgo+aHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rL3IvMC12
My05ZGJmMGE3MmE1MWMrMzAyLWlvbW11X3B0X3Jpc2N2X2pnZ0BudmlkaWEuY29tCj4KPkl0IHNo
b3VsZCBnZXQgcGlja2VkIHVwIGVhcmx5IGluIHRoZSBuZXh0IGN5Y2xlCgpUaGFua3MuIEFja25v
d2xlZGdlZOKAlEnigJlsbCByZXdvcmsgdGhlIHNlcmllcyBvbiB0b3Agb2YgdGhlIG5ldyBSSVND
LVYgSU9NTVUgcGFnZQp0YWJsZSBwYXRjaGVzIG9uY2UgdGhleeKAmXJlIGluIGZvciB0aGUgbmV4
dCBjeWNsZS4KCj4KPkphc29uCgpGYW5neXUsClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
