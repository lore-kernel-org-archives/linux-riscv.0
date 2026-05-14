Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE92CD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 19:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n0PwG+sOhPlAMkx0sniUUj0xjCrSjjdpOI9OUE8qNRg=; b=OvL6Ru3pINEI4p5CX9CM2CQRpa
	Gajym/D4A5NLCcvBrs8yCF4mqDGFCgOwLRDk8Hv38p6pTP0xqENdyRrHQw9+QFo0c15ai3TQoL92d
	TPQj3nuBoyFVr0JJt3KzQ0fu8+L6y8GZ526RFBFpgIFcZMAnRtyofAVu7phm5FqGlTlWQeJ3sBMTn
	aTbSrEEI02APJwhw89K+/r54kAel+nfT9gYKutM84+GOR5fpCzVR8yqLfKW6UYkHMkty2WHCkC2PQ
	76FD7U4VUSDkKX/mcP0L0m5IVqtQ61djVfo4f05U1E7FJgjz02XOljuCss/vOobNWpImQkhsDQ7zL
	iUi9R4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbMK-00000006O9U-0RCk;
	Thu, 14 May 2026 19:04:36 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZBc-00000006689-299J
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 16:45:25 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-56f75445470so4836570e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 09:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778777122; cv=none;
        d=google.com; s=arc-20240605;
        b=FLZHmce2qDGbxmnh/yJJR2e7fkLlK8JGQNOw0XQdm/2dsmoTK9mif+XIlY3TlXMdlZ
         CPQlfMP9S2zhE82+iPplT4OkceN2+fH0CqLvNINnKiugUoXVSTscMFLNE652qFAwMGd8
         RZRSkGsJFZ2hocq7zwWn2BPgStiuWEF1gqZtbEFAa187CG8eWxswO/Kx6d/xJypcgk/n
         wfyWLEeJZ+MUn1SBqavjoUjnfxzF2ijyNeEjESzL3mD1CEuuZsNXwKb8LnKrCurK06Xn
         dKLAkCcyMmMOnOIRPY5u7iurKVCsRAWJLW7ghN5KUClEbJ6zdv3VFaXCezUJHB5eij3k
         Al0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=os0eHsZVJX0chVl1RmCC7RjaweXl8YpOUWjuIOShXWI=;
        fh=ORKuLEXUKzfIfly6M4oSggd+ZoDBvdaYoVaQxbgPyyY=;
        b=fDi+51apW5O8e7PedulFo5TEEzPyg/gYvEShvdF5hsFdB6WfMufL8Ju5VZzswskPZ3
         h/sfjQKH/IRzJvRo1dO1faV/mC+jefXweiwLjcilp+vojWORqg1sGj/IrlO5rcocJY7z
         Wxtau3DQUoyWbn3AWGqeq/9rriJwHuGvN8GyN8VLzyLR/zqBHBoYt1ejbmH3sb+kvNW5
         nyVOgRKf7F5p+pgceL83yTx6GQsmLvvWXePdqgjeOt8X7ThwbFNDLAgk4GB7z6MKZiMm
         CaGVhv72ibVRwTtMM00LOQg+eUzVkdf6XSJgt7tUGD24BsdpfB/CwOLD9YddEk3pKmVd
         jUMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778777122; x=1779381922; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os0eHsZVJX0chVl1RmCC7RjaweXl8YpOUWjuIOShXWI=;
        b=jNBnf5OAz5qObEMU/2P3X6LNbkSd1Ru9G2hM87KXrn/l+JM6FLKi0Qt8D/18rNV8Ys
         pleVaWkg9325Bxcyo6Nyqsr7XLI4yNXmr2DkvZLz/Ldue0kGb9MY6p198utYvrTPMrWl
         yf79ldv+rejODuS2nlQk+ywjsVx6TPOurjq6izMTKhcrvNIGvHCfi93fsnQIfER7PlLj
         fpNlc12DhZOprpbbi0yf9DN8i5tLeR82HeiYJ9M7Z0D8VR2q9rxhqGa50/4d9cIWpS+C
         VIJEG+wq8kBdpvL2ZaMlFBvkk3UrK/z1XA6lLBj5uuaOO0mTXtJImViklamtbLJOwGGF
         CdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778777122; x=1779381922;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=os0eHsZVJX0chVl1RmCC7RjaweXl8YpOUWjuIOShXWI=;
        b=R5x6bzwArlCLtJQ6RbUR9Ly3QbSPoxt/LnXDyXW0yy8VmM6LCzDRwuvyuAWgYQVAVQ
         /Ie7eL6lDBM6aIDUd4hJnz4oaWulx4vN9pL8rtMTBbhckrFxRJtnQPXScaubGeTxX5AP
         UuFlpG9zAMTCWjQ2QrPQbutDTBh/ZZpQxea6kwK41pVPC0SxYJZu1WvrXZdUviQ2GwoM
         Qwgd6Oo3zkzatpLt1LXsOZR4+E1P71ftlhKZ7/rFCqVb1lKICzgwMpGety4WcFhXbC3o
         EL5KMYJC5xh9iXAEaweRjwYoAD3dpPNEV8TAxj9GNq91ZHxN4KjQ65u/gqyFsZUvuCVR
         dgEA==
X-Forwarded-Encrypted: i=1; AFNElJ+Jp9fWW2tp9UKvdH2J72CUOWcqSKJn9yN/d4AfpP/V2merXlaU+24xJxNI+DsByZhOVN2XB44oBTKbRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIgMqlA6hGkawd7TJQDSkWnSwc4Fp5O2oZEsjXZ6HtlGA+K/PO
	wJsMQGDGRtH1SfgVNo/ozG2Fnsc0u2jyM9OIb0zKh6yXJUsaF9NEkBkTfeqPrEvPsSN6NEJNGAm
	ADyWTV1+1drsh3KJut4sVzm5nmWmbXDznu6soZ/0m
X-Gm-Gg: Acq92OELsC7rAQRKDRJ114I/blbsctvyamdxj/zqBlKcEFwqYG9u+KVmtjpJ7a1ZJ1r
	ngcXmeBJ5g4l5LWAF4xhAYGHxj7VDPBEvLkxanm/748vDVeutMS12DaxNsufzujQs0+RbPY1/RA
	CLu7RuClvr8D9fIG0wFS33S+3e5YoLGI6LrSVE55bT1U8bo2+ySXwcQ5/NiThUNB5W8TlwPkBEb
	kBj+Xj1ZFCFcAVHbtrnh2L3B0PluGyl9ZkPpsbr2ApQDsysHwT45K1/NGGZ1UBqzU32PldN/MVu
	GtjjUgg+UoVIzFnKnBteLWr+uPqNUqq9ZM9zC97d0QQX1J9MEXGnee4jccm2MJ2H+FQsCZUxx1K
	vlxt/
X-Received: by 2002:a05:6122:1814:b0:575:178f:62d2 with SMTP id
 71dfb90a1353d-5760c092d3cmr165926e0c.14.1778777121451; Thu, 14 May 2026
 09:45:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 May 2026 09:45:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 May 2026 09:45:19 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260508081812.12345-1-itazur@amazon.com>
References: <CAPTztWb67XZvfcMVnbegDNNW0LJa9UsaTGx3M898xJUJrekk0w@mail.gmail.com>
 <20260508081812.12345-1-itazur@amazon.com>
MIME-Version: 1.0
Date: Thu, 14 May 2026 09:45:19 -0700
X-Gm-Features: AVHnY4JqumP2VJstFZ-DobQ0sDmpWwtOhYCl663Ih2m9TKxeTUM0glktONR3Yps
Message-ID: <CAEvNRgG07EMrx-SpMaO3gHmdGVwOb75XNy7_RARBo0chidn7Yg@mail.gmail.com>
Subject: Re: [PATCH v12 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
To: Takahiro Itazuri <itazur@amazon.com>, fvdl@google.com, seanjc@google.com, ljs@kernel.org
Cc: Liam.Howlett@oracle.com, agordeev@linux.ibm.com, ajones@ventanamicro.com, 
	akpm@linux-foundation.org, alex@ghiti.fr, andrii@kernel.org, 
	aou@eecs.berkeley.edu, ast@kernel.org, baolu.lu@linux.intel.com, 
	borntraeger@linux.ibm.com, bp@alien8.de, bpf@vger.kernel.org, 
	catalin.marinas@arm.com, chenhuacai@kernel.org, corbet@lwn.net, 
	coxu@redhat.com, daniel@iogearbox.net, dave.hansen@linux.intel.com, 
	david@kernel.org, derekmn@amazon.com, dev.jain@arm.com, eddyz87@gmail.com, 
	gerald.schaefer@linux.ibm.com, gor@linux.ibm.com, haoluo@google.com, 
	hca@linux.ibm.com, hpa@zytor.com, itazur@amazon.co.uk, jackabt@amazon.co.uk, 
	jackmanb@google.com, jannh@google.com, jgg@ziepe.ca, jgross@suse.com, 
	jhubbard@nvidia.com, jiayuan.chen@shopee.com, jmattson@google.com, 
	joey.gouly@arm.com, john.fastabend@gmail.com, jolsa@kernel.org, 
	jthoughton@google.com, kalyazin@amazon.co.uk, kas@kernel.org, 
	kernel@xen0n.name, kpsingh@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, lenb@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	lorenzo.stoakes@oracle.com, luto@kernel.org, maobibo@loongson.cn, 
	martin.lau@linux.dev, maz@kernel.org, mhocko@suse.com, mingo@redhat.com, 
	mlevitsk@redhat.com, nikita.kalyazin@linux.dev, oupton@kernel.org, 
	palmer@dabbelt.com, patrick.roy@linux.dev, pavel@kernel.org, 
	pbonzini@redhat.com, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, pjw@kernel.org, prsampat@amd.com, rafael@kernel.org, 
	riel@surriel.com, rppt@kernel.org, ryan.roberts@arm.com, sdf@fomichev.me, 
	shijie@os.amperecomputing.com, skhan@linuxfoundation.org, song@kernel.org, 
	surenb@google.com, suzuki.poulose@arm.com, svens@linux.ibm.com, 
	tabba@google.com, tglx@kernel.org, thuth@redhat.com, urezki@gmail.com, 
	vannapurve@google.com, vbabka@kernel.org, will@kernel.org, 
	willy@infradead.org, wu.fei9@sanechips.com.cn, x86@kernel.org, 
	yang@os.amperecomputing.com, yangyicong@hisilicon.com, 
	yonghong.song@linux.dev, yosry@kernel.org, yu-cheng.yu@intel.com, 
	yuzenghui@huawei.com, zhengqi.arch@bytedance.com, zulinx86@gmai.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_094524_561131_A42CCBCE 
X-CRM114-Status: GOOD (  33.84  )
X-Mailman-Approved-At: Thu, 14 May 2026 12:04:34 -0700
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

VGFrYWhpcm8gSXRhenVyaSA8aXRhenVyQGFtYXpvbi5jb20+IHdyaXRlczoKCj4KPiBbLi4uc25p
cC4uLl0KPgoKQnJvdWdodCB0aGlzIHRvcGljIHVwIG9uIHRoZSBndWVzdF9tZW1mZCBiaXdlZWts
eSB0b2RheSEKCj4KPiBBZ3JlZWQgd2l0aCBib3RoIG9mIHlvdS4gIEknbGwgYWRvcHQgdGhlIGZp
bGVtYXAtbGV2ZWwgYXBwcm9hY2g6Cj4KPiAtIE1vdmUgdGhlIHphcC9yZXN0b3JlIGhvb2tzIGZy
b20gZ3Vlc3RfbWVtZmQgaW50byBmaWxlbWFwX2FkZF9mb2xpbygpCj4gICAvIGZpbGVtYXBfcmVt
b3ZlX2ZvbGlvKCkuCj4gLSBUaWdodGVuIEFTX05PX0RJUkVDVF9NQVAgc2VtYW50aWNzIHNvIHRo
YXQsIGZvciBmb2xpb3MgaW4gc3VjaCBhCj4gICBtYXBwaW5nLCB0aGUgZGlyZWN0IG1hcCBpcyBp
bnZhbGlkIGZvciB0aGUgZW50aXJlIHRpbWUgdGhlIGZvbGlvCj4gICByZXNpZGVzIGluIHRoZSBw
YWdlIGNhY2hlLgo+IC0gRHJvcCB0aGUgcGVyLWZvbGlvIEtWTV9HTUVNX0ZPTElPX05PX0RJUkVD
VF9NQVAgYm9va2tlZXBpbmcgaW4KPiAgIGZvbGlvLT5wcml2YXRlLCBzaW5jZSB0aGUgZXhpc3Rl
bmNlIG9mIHRoZSBmb2xpbyBpbiB0aGUgbWFwcGluZyBpcwo+ICAgaXRzZWxmIHRoZSBzdGF0ZS4K
Pgo+IE9uIGVhY2ggZ3Vlc3QgbWVtb3J5IHBvcHVsYXRpb24gcGF0aCwKPgo+IC0gbWVtY3B5LWJh
c2VkIHBvcHVsYXRpb24gZnJvbSB1c2Vyc3BhY2UgZ29lcyB0aHJvdWdoIHRoZSB1c2Vyc3BhY2UK
PiAgIG1hcHBpbmcgb2YgZ3Vlc3RfbWVtZmQsIG5vdCB0aHJvdWdoIHRoZSBrZXJuZWwgZGlyZWN0
IG1hcCwgc28gdGhlCj4gICBmaWxlbWFwLWxldmVsIGludmFyaWFudCBkb2Vzbid0IGFmZmVjdCBp
dC4gIEJ1dCB0aGlzIGlzIHNsb3csIHdoaWNoCj4gICBpcyB3aGF0IG1vdGl2YXRlZCB0aGUgd3Jp
dGUoKSBzeXNjYWxsIHN1cHBvcnQuCj4KPiAtIHdyaXRlKCk6IG1lYW50IHRvIHNwZWVkIHVwIHRo
ZSB1c2Vyc3BhY2UtbWVtY3B5IGNhc2UgYWJvdmUgYnkgZG9pbmcKPiAgIHRoZSBjb3B5IGluIHRo
ZSBrZXJuZWwuICBJIGJlbGlldmUgQnJlbmRhbidzIF9fR0ZQX1VOTUFQUEVEL21lcm1hcAo+ICAg
d29yayBbMV0gd291bGQgZ2l2ZSB1cyBhIGxvdy1vdmVyaGVhZCB3YXkgdG8gZ2V0IHRlbXBvcmFy
eSBrZXJuZWwKPiAgIGFjY2VzcyB0byBhbiBBU19OT19ESVJFQ1RfTUFQLiAgTGFuZGluZyBtZXJt
YXAgbWF5IHRha2UgYSB3aGlsZSwgYnV0Cj4gICB0aGlzIHNlcmllcyBkb2VzIG5vdCBpbnRyb2R1
Y2UgdGhlIHdyaXRlKCkgcGF0aCwgc28gbWVybWFwIGlzIG5vdCBhCj4gICBibG9ja2VyIGZvciBu
b3cuCj4KPiAtIGt2bV9nbWVtX3BvcHVsYXRlKCk6IHRoaXMgaXMgYSBURFgvU05QLW9ubHkgcGF0
aCwgYW5kIE5PX0RJUkVDVF9NQVAKPiAgIGlzIG5vdCBhdmFpbGFibGUgb24gdGhvc2UgVk0gdHlw
ZXMg4oCUCj4gICBrdm1fYXJjaF9nbWVtX3N1cHBvcnRzX25vX2RpcmVjdF9tYXAoKSByZXR1cm5z
IGZhbHNlIGZvcgo+ICAgS1ZNX1g4Nl9URFhfVk0gYW5kIEtWTV9YODZfU05QX1ZNLCB3aGljaCBh
cmUgaXRzIG9ubHkgY2FsbGVycwo+ICAgdG9kYXkuICBTbyBpdCBkb2Vzbid0IGludGVyYWN0IHdp
dGggdGhlIGZpbGVtYXAgaW52YXJpYW50IElJVUMuCj4KCkknbSBhIGxpdHRsZSBiaXQgdW5jb21m
b3J0YWJsZSB0aGlzIHN0YXRlbWVudCBzaW5jZSBpdCBzZWVtcyB0byBzYXkgVERYCmFuZCBTTlAg
YXJlbid0IHRha2VuIGNhcmUgb2YuIFdvdWxkIGp1c3QgbGlrZSB0byBkaXNjdXNzIChmb3IKYSBs
aW5lIG9mIHNpZ2h0IHRvIFNOUCBhbmQgVERYIHN1cHBvcnQpOgoKRm9yIG5vbi1pbi1wbGFjZSBw
b3B1bGF0aW9uIHdoZXJlIHRoZSBzb3VyY2UgcGh5c2ljYWwgcGFnZSBpcyBkaWZmZXJlbnQKZnJv
bSB0aGUgZGVzdGluYXRpb24gcGh5c2ljYWwgcGFnZSwKCisgVERYOiB0aGUgVERYIG1vZHVsZSBk
b2VzIHRoZSBwb3B1bGF0aW9uIGFuZCB3b3JrcyB3aXRoIHBoeXNpY2FsCiAgYWRkcmVzc2VzLCBz
byBubyBpc3N1ZSB3aXRoIHBvcHVsYXRlPyBPdGhlciBwYXJ0cyBvZiBURFggbWF5IGhhdmUKICB0
cm91YmxlIHRob3VnaCwgYnV0IHRoYXQgY2FuIGJlIGhhbmRsZWQgbGF0ZXIuCisgU05QOiBzZXZf
Z21lbV9wb3N0X3BvcHVsYXRlKCkgZG9lcyBhIG1lbWNweSgpIGFmdGVyIHVzaW5nCiAga21hcF9s
b2NhbF9wYWdlKCkKCldvdWxkIG1lcm1hcCBiZSBhIGRyb3AgaW4gcmVwbGFjZW1lbnQgZm9yIGtt
YXBfbG9jYWxfcGFnZSgpIGhlcmU/IFdvdWxkCmd1ZXN0X21lbWZkIG5lZWQgdG8gZm9yY2UgYSBU
TEIgZmx1c2ggYWZ0ZXIgbWVybWFwK21lbWNweT8KCj4gU28sIHVubGVzcyBJJ20gbWlzc2luZyBh
bnkgcGF0aCwgYWRvcHRpbmcgdGhlIGZpbGVtYXAtbGV2ZWwgYXBwcm9hY2ggaW4KPiB0aGlzIHNl
cmllcyBzaG91bGQgYmUgZmluZS4KPgo+Cj4gSSdkIGxpa2UgdG8gY29uc3VsdCB3aXRoIHlvdSBm
b2xrcyBvbiBob3cgdG8gcHJvY2VlZCBpbiBhZHZhbmNlLiAgSW4gYQo+IHNlcGFyYXRlIHJlcGx5
IG9uIHRoZSBjb3ZlciBsZXR0ZXIgdGhyZWFkIFsyXSwgTG9yZW56byBhbmQgU2Vhbgo+IHN1Z2dl
c3RlZCB0aGF0IHRoZSBtbSBwaWVjZXMgc2hvdWxkIGdvIHRocm91Z2ggdGhlIG1tIHN1YnN5c3Rl
bToKPgo+IE9uIFR1ZSwgQXByIDIxLCAyMDI2IGF0IDA0OjM2OjAwUE0gKzAwMDAsIFNlYW4gQ2hy
aXN0b3BoZXJzb24gd3JvdGU6Cj4+IFllYWgsIHdoZW4gdGhlIHRpbWUgY29tZXMsIHRoZSBtbSBw
aWVjZXMgZGVmaW5pdGVseSBuZWVkIHRvIGdvIHRocm91Z2ggdGhlIG1tCj4+IHRyZWUuICBJZGVh
bGx5LCBJIHRoaW5rIHRoaXMgd291bGQgYmUgbWVyZ2VkIGluIHR3byBzZXBhcmF0ZSBwYXJ0cywg
d2l0aCBhbGwgbW0KPj4gY2hhbmdlcyBnb2luZyB0aHJvdWdoIHRoZSBtbSB0cmVlLCBhbmQgdGhl
biB0aGUgS1ZNIGNoYW5nZXMgdGhyb3VnaCB0aGUgS1ZNIHRyZWUKPj4gdXNpbmcgYSBzdGFibGUg
dG9waWMgYnJhbmNoL3RhZyBmcm9tIEFuZHJldy4KPgo+IEkgc2VlIHR3byByZWFzb25hYmxlIHBh
dGhzIHRvIGdldCB0aGVyZSwgYW5kIHdvdWxkIGFwcHJlY2lhdGUgeW91cgo+IGlucHV0IG9uIHdo
aWNoIHlvdSBwcmVmZXI6Cj4KPiBQYXRoIEEg4oCUIHZhbGlkYXRlIG9uIEtWTSBzaWRlIGZpcnN0
LCB0aGVuIHNwbGl0Ogo+ICAgLSBQb3N0IHYxMyBhcyBhIHNpbmdsZSBzZXJpZXMgb24gdGhlIEtW
TSBsaXN0LCBnYXRoZXIgZmVlZGJhY2sgYW5kCj4gICAgIG1ha2Ugc3VyZSB0aGUgZGVzaWduIGlz
IGFjY2VwdGFibGUgdG8gS1ZNIHJldmlld2Vycy4KPiAgIC0gT25jZSB2MTMgbG9va3MgZ29vZCAo
InRoZSB0aW1lIGNvbWVzIiksIGRvIHRoZSBNTS9LVk0gc3BsaXQsCj4gICAgIHJlYmFzZSB0aGUg
TU0gcGFydCBvbnRvIHRoZSBhcHByb3ByaWF0ZSBNTSBicmFuY2gsIGFuZCBwb3N0IHRoZQo+ICAg
ICBNTSBwYXJ0IHRvIGxpbnV4LW1tIHRvIGJ1aWxkIGNvbnNlbnN1cyB3aXRoIE1NIG1haW50YWlu
ZXJzLgo+Cj4gUGF0aCBCIOKAlCBzcGxpdCBlYXJseSBhbmQgc2VlayBNTSBjb25zZW5zdXMgaW4g
cGFyYWxsZWw6Cj4gICAtIFdpdGggdGhlIGZpbGVtYXAgcmV3b3JrIGFscmVhZHkgaW4gcGxhY2Us
IGRvIHRoZSBNTS9LVk0gc3BsaXQKPiAgICAgbm93IGFuZCBwb3N0IHRoZSBNTSBwYXJ0IHRvIGxp
bnV4LW1tIGRpcmVjdGx5LiAgVGhlIEtWTSBwYXJ0IGZvbGxvd3MKPiAgICAgb24gdG9wIG9mIGEg
c3RhYmxlIHRvcGljIGZyb20gTU0uCj4KPiBXaGljaCBvZiB0aGUgdHdvIHdvdWxkIHlvdSByYXRo
ZXIgc2VlPyAgSGFwcHkgdG8gZ28gZWl0aGVyIHdheS4KPgoKVmxhc3RpbWlsIHBvaW50ZWQgb3V0
IHRoYXQgdGhlcmUncyBhIHRlbXBvcmFyeSBsaW1pdGF0aW9uIG5vdyB0aGF0IHRoZQptbS10cmVl
IGNhbm5vdCBkbyBzdGFibGUgYnJhbmNoZXMgc2hhcmVkIGJldHdlZW4gdHJlZXMgbm93LgoKSSB0
aGluayBpdCBkZXBlbmRzIG9uIGhvdyBxdWlja2x5IHlvdSBwbGFuIHRvIHJlZnJlc2ggdGhpcyBz
ZXJpZXMsIGJ1dApQYXRoIEEgd291bGRuJ3QgYmUgYmxvY2tlZCBieSB0aGUgdGVtcG9yYXJ5IGxp
bWl0YXRpb24uCgpNeSBvcGluaW9uIHdvdWxkIGJlIHRvIGdvIGFoZWFkIHdpdGggYSBuZXcgcmV2
aXNpb24gKFBhdGggQSkgdG8gZnVsbHkKYWRkcmVzcyBjb21tZW50cyBiZWZvcmUgc3BsaXR0aW5n
IHRoZSBzZXJpZXMuIEFueSBSZXZpZXdlZC1ieXMgY2FuIGJlCmNhcnJpZWQgb3ZlciB0byB0aGUg
c3BsaXQgc2VyaWVzIGFueXdheSA6KQoKQWx0ZXJuYXRpdmVseSB5b3UgY291bGQgd2FpdCB0aWxs
IGNvbnZlcnNpb24gbGFuZHMgOlAgRWl0aGVyIG9uZSBvZiB1cwp3aWxsIG5lZWQgdG8gZG8gbW9y
ZSB3b3JrIGZvciBjb252ZXJzaW9uIHdydCBkaXJlY3QgbWFwIHJlbW92YWwuCgo+Cj4gWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDMyMC1wYWdlX2FsbG9jLXVubWFwcGVkLXYy
LTAtMjhiZjFiZDU0ZjQxQGdvb2dsZS5jb20vCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDUwNjA4MDc1My4xNDUxNy0xLWl0YXp1ckBhbWF6b24uY29tLwo+Cj4gVGFrYWhp
cm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
