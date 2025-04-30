Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4BFC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 20:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZK9VB/n8bNCPfQlDihFFZ8mJbPAHvOg7RPQVfVAPB0=; b=1NXGdANKgNI9VE
	g+qyjgcYhT8bajkBKayjGWlcC44RlLlTVVPa/QdrCAQH/VmzOFtQYd6nXjlqw9SDqvq37hLEIY87e
	qkMcdcozGVHnUMWswQV9USLTLkphr8oKPuJ7VkwoYfuguxgjJjL1+YrBPa9TZHgztCnVaMc121opH
	BPUFYC1ktBbFH007HpXy9FKZDO46espXUK4fccKv1rUryCU7XI6oUMdsZCLiIDP7/953E2IoCfU+F
	PPknrHtGNfcgRngJ8lvk9P6N0z9aM9VIDGruP5Ve3LOzx/UjvsCBRbQnskKTNOuO2e4MbLr8jfgfI
	Ay2HqANgh5VN91I5QMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAEDN-0000000Dwht-1zCq;
	Wed, 30 Apr 2025 20:39:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE59-0000000DvMB-0pcC
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 20:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=; b=vJ2tCZXI9P7yHCgbR27Ak9/+7k
	m1y5oQGEttxpwu72HJ1D2A7iskAr04fQYQyJEWtM+LbkpT0o5WF89v5ffXpcUk7x9xvr+keUdU/lG
	dz+W5h3COX7Uu/dEQILjHqwafr1mk48zIgQ3YNkA4f/luhlEgjxDhIB7076bmIVaYenGrRCO513Qp
	LV4YdtG4Ifb4Awewmko46FLYLU8iTjVhKkLKbimqaLQO4wC404gafdewOR1Rfb4zYNAcfnj5vtUvf
	kyXJTtNkI+CsUs5cSbau25sZutDUwF/FHS+wzw6cWdWVi75++2GH2Km8VHRHhCwH0bQ+MokZzmLyH
	6RwezUWA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE55-0000000DrJq-1WN7
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 20:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=SG/touyuWU8T26H/R6+Rjf3K8kQAvheDXhewyHARI9TePnN+ltaprjOhHOo66WCYDxXzI2
	zYdCFibtU6xQXVYEh/6n5kFRRi8UNJqYQQE95p/j7od0fE2lNzxIjPPXVtgwAYVCl7aYHD
	TQ+qUmajg6Sz6xXlNCJF/mU+pGIjKa4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=SG/touyuWU8T26H/R6+Rjf3K8kQAvheDXhewyHARI9TePnN+ltaprjOhHOo66WCYDxXzI2
	zYdCFibtU6xQXVYEh/6n5kFRRi8UNJqYQQE95p/j7od0fE2lNzxIjPPXVtgwAYVCl7aYHD
	TQ+qUmajg6Sz6xXlNCJF/mU+pGIjKa4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=ifWUo/aXxrRpgDc8iELJdN/0C8sqMFxb5/gwyp7AsFTSQnq9zxbCJgxWuA6NMC2MdukIlC
	FIpJMSthcsB1gwVuK1Uz+6I3Zhg1Rksa2Tdr2+28cp5KEupVCHsvp1RlluEfew+VOjkD+v
	pCmtnYCLmspzlPYfR4num4A0IJQe3vo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-yMa2G6G6N4OfRCNg_Vb2mg-1; Wed, 30 Apr 2025 16:30:55 -0400
X-MC-Unique: yMa2G6G6N4OfRCNg_Vb2mg-1
X-Mimecast-MFC-AGG-ID: yMa2G6G6N4OfRCNg_Vb2mg_1746045054
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso7229666d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 13:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045054; x=1746649854;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLCLNjhH9N/SbhZgwe55OZ5mfyV+uMRJ+/FIl8sp4MU=;
        b=FYN3Lch7K2bWnCi4LFgGEP7ED8o8RIPvA1LMlQwrucxxWgZ3JCtxsedo1lX+cAyquc
         bb10Re3g2+WJR9C/HZM2h1JLT3mRZgLioJIaMkcWZBl+wfgqdJKVxCjpoJGGZugVpT0l
         Bd9IEs+LdT4evwpEaIRHE8WHt1rO4bWhgf4psHQxKqePSLyMVaXsq9JrPMusOzsTmLp/
         5Qaa8LXpcI0l22AeB3SQwnVB/XedePSLO4KWjTcm49ojhD8VuVh+QA1/AwTCblNost/O
         nRwoioSA5LQDqLYjpQBPKcslxWZhAoYUFEKRT38IQ9ogTfmY2vs+ZCAfxLJboKANFjBk
         Mx9A==
X-Forwarded-Encrypted: i=1; AJvYcCW/Rk88nPaqjyBsYu9eiytk6SQ95wGWLUzQJkYWdzH6TPTo6xKbxdd+rBbzyLy+J2xtHrji0GSzm0h4zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQcxuDoHd+4W3vklQ0UUTdaWg3L1+W4g+BVWBHQH++mpI/Wfkf
	hCmZWxUEq+4YH5kd7GS6GhLWVIR8tA2+iL+Hk3wycQSauk78oxYn/wxgxrS7W+5yU+o5pSab0Oc
	0VIcKe7SeXca+E0n5eH9TwN7mh0ldJ0kq12ihVXIxu8h5xfIYB1CNNZWA4S+I0+PBTQ==
X-Gm-Gg: ASbGncteZhOh4sMyyZOm+RSnuz33OHFzK6VCthfZ9o05Zd7ealrtoIQT/YIgH3qf8/K
	gk6/sZfK9F9IqeKD7JCGQ3Z1gFccP0y2JYO31+sux0Skc0hS/IpmnqPQC/5VIgBU8E38MNXljSe
	GPw1CGaJ37oMaAiuqdZDJLHCfWkS/vkEHLBhWB4mLDr3pwNP4QYhFv9fq2ChKAODraZqRYjU1QF
	wzfYPDk/pZkjU7vy/1+xK0gXDKB8XJ+2kH7gXM2JvRvqZ6N13b3Tukrxs261tnyIHUvJYZxsBfT
	5ZRwRavMDZuzMEUE6gxb+1Mo+1JOcvM1CQv8tYf7tzkBtEVQjiPOVsaj7UI=
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60226286d6.25.1746045054702;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqMC1VAUYkFR8BRk72B9YM6tHcI7coSFQe+I2l2BvKOrJizso3ayI0TGKXXExNYQxM53jAuA==
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60225826d6.25.1746045054231;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a277sm12416546d6.55.2025.04.30.13.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:30:53 -0700 (PDT)
Message-ID: <53a26378fce90c8bbfa57a582992324560aa0274.camel@redhat.com>
Subject: Re: [PATCH v3 0/4] KVM: lockdep improvements
From: mlevitsk@redhat.com
To: kvm@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Randy Dunlap
 <rdunlap@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, Will Deacon
 <will@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Kunkun Jiang
 <jiangkunkun@huawei.com>, Jing Zhang <jingzhangos@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Keisuke Nishimura <keisuke.nishimura@inria.fr>, 
 Anup Patel <anup@brainfault.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>,
 kvmarm@lists.linux.dev, Waiman Long <longman@redhat.com>,  Boqun Feng
 <boqun.feng@gmail.com>, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Sebastian Ott
 <sebott@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Ingo Molnar
 <mingo@redhat.com>, Alexandre Ghiti <alex@ghiti.fr>, Bjorn Helgaas
 <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Joey Gouly
 <joey.gouly@arm.com>, Borislav Petkov <bp@alien8.de>, Sean Christopherson
 <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Alexander Potapenko
 <glider@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org, Shusen Li
 <lishusen2@huawei.com>,  kvm-riscv@lists.infradead.org
Date: Wed, 30 Apr 2025 16:30:51 -0400
In-Reply-To: <20250430202311.364641-1-mlevitsk@redhat.com>
References: <20250430202311.364641-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vfj2oqko_4VsWBUEBXKmi_mSrKNInli7KoEoKSB7grw_1746045054
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_213059_858923_ED1A691D 
X-CRM114-Status: GOOD (  15.53  )
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

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDE2OjIzIC0wNDAwLCBNYXhpbSBMZXZpdHNreSB3cm90ZToK
PiBUaGlzIGlzCWEgY29udGludWF0aW9uIG9mIG15ICdleHRyYWN0Cj4gbG9ja19hbGxfdmNwdXMv
dW5sb2NrX2FsbF92Y3B1cycKPiBwYXRjaCBzZXJpZXMuCj4gCj4gSW1wbGVtZW50IHRoZSBzdWdn
ZXN0aW9uIG9mIHVzaW5nIGxvY2tkZXAncyAibmVzdF9sb2NrIiBmZWF0dXJlCj4gd2hlbiBsb2Nr
aW5nIGFsbCBLVk0gdkNQVXMgYnkgYWRkaW5nIG11dGV4X3RyeWxvY2tfbmVzdF9sb2NrKCkgYW5k
Cj4gbXV0ZXhfbG9ja19raWxsYWJsZV9uZXN0X2xvY2soKSBhbmQgdXNlIHRoZXNlIGZ1bmN0aW9u
cwlpbiB0aGUKPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUKPiBrdm1fdHJ5bG9ja19hbGxfdmNwdXMo
KS9rdm1fbG9ja19hbGxfdmNwdXMoKS9rdm1fdW5sb2NrX2FsbF92Y3B1cygpLgo+IAo+IFRob3Nl
IGNoYW5nZXMgYWxsb3cgcmVtb3ZhbCBvZiBhIGN1c3RvbSB3b3JrYXJvdW5kIHRoYXQgd2FzIG5l
ZWRlZCB0bwo+IHNpbGVuY2UgdGhlIGxvY2tkZXAgd2FybmluZyBpbiB0aGUgU0VWIGNvZGUgYW5k
IGFsc28gc3RvcCBsb2NrZGVwCj4gZnJvbQo+IGNvbXBsYWluaW5nIGluIGNhc2Ugb2YgQVJNIGFu
ZCBSSVNDLVYgY29kZSB3aGljaCBkb2Vzbid0IGluY2x1ZGUgdGhlCj4gYWJvdmUKPiBtZW50aW9u
ZWQgd29ya2Fyb3VuZC4KPiAKPiBGaW5hbGx5LCBpdCdzIHdvcnRoIG5vdGluZyB0aGF0IHRoaXMg
cGF0Y2ggc2VyaWVzIHJlbW92ZXMgYSBmYWlyCj4gYW1vdW50IG9mIGR1cGxpY2F0ZSBjb2RlIGJ5
IGltcGxlbWVudGluZyB0aGUgbG9naWMgaW4gb25lIHBsYWNlLgo+IAo+IEJlc3QgcmVnYXJkcywK
PiAJTWF4aW0gTGV2aXRza3kKPiAKPiBNYXhpbSBMZXZpdHNreSAoNCk6Cj4gwqAgYXJtNjQ6IEtW
TTogdXNlIG11dGV4X3RyeWxvY2tfbmVzdF9sb2NrIHdoZW4gbG9ja2luZyBhbGwgdkNQVXMKPiDC
oCBSSVNDLVY6IEtWTTogc3dpdGNoIHRvIGt2bV9sb2NrL3VubG9ja19hbGxfdmNwdXMKPiDCoCBs
b2NraW5nL211dGV4OiBpbXBsZW1lbnQgbXV0ZXhfbG9ja19raWxsYWJsZV9uZXN0X2xvY2sKPiDC
oCB4ODY6IEtWTTogU0VWOiBpbXBsZW1lbnQga3ZtX2xvY2tfYWxsX3ZjcHVzIGFuZCB1c2UgaXQK
PiAKPiDCoGFyY2gvYXJtNjQvaW5jbHVkZS9hc20va3ZtX2hvc3QuaMKgwqDCoMKgIHzCoCAzIC0t
Cj4gwqBhcmNoL2FybTY0L2t2bS9hcmNoX3RpbWVyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
NCArLQo+IMKgYXJjaC9hcm02NC9rdm0vYXJtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgNDMgLS0tLS0tLS0tLS0tLS0tLQo+IMKgYXJjaC9hcm02NC9rdm0vdmdpYy92Z2lj
LWluaXQuY8KgwqDCoMKgwqDCoCB8wqAgNCArLQo+IMKgYXJjaC9hcm02NC9rdm0vdmdpYy92Z2lj
LWl0cy5jwqDCoMKgwqDCoMKgwqAgfMKgIDggKy0tCj4gwqBhcmNoL2FybTY0L2t2bS92Z2ljL3Zn
aWMta3ZtLWRldmljZS5jIHwgMTIgKystLS0KPiDCoGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2Uu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzQgKy0tLS0tLS0tLS0tLQo+IMKgYXJjaC94ODYva3Zt
L3N2bS9zZXYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDcyICsrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAtLQo+IMKgaW5jbHVkZS9saW51eC9rdm1faG9zdC5owqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKysKPiDCoGluY2x1ZGUvbGludXgvbXV0ZXguaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTcgKysrKystLQo+IMKga2VybmVsL2xvY2tp
bmcvbXV0ZXguY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArLS0KPiDCoHZp
cnQva3ZtL2t2bV9tYWluLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1
OSArKysrKysrKysrKysrKysrKysrKysrCj4gwqAxMiBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5zZXJ0
aW9ucygrKSwgMTY3IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuNDYuMAo+IAo+IAoKCkkgZm9y
Z290IHRvIHNlbmQgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcywgcmVzZW5kaW5nLgoKQmVzdCBy
ZWdhcmRzLAoJTWF4aW0gTGV2aXRza3kKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
