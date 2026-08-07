Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A01CC5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjnsIJnEjXsqdGG0oF2yVPdC4hoF2+roXEaRufpyTJs=; b=Sjr++q/zF2E85F
	LuHhPBSpHBe3jW+neAxLx34/uXe/77pWs5RkW/Bwlqs/WcO4McRE8SEUXp4qCpJefHzyVLzhdZwME
	9o+FmOqDOL3VLqBHHiP7fntFWIFs0REfn2m4JDs74Wd/YemdHGlUEtfgoiOQyUYcclm891kKssJSF
	i325An0sj1nx0GT1Z4szsZc+LP6lk8KUHCvqt3NCIed3m0vu6V8xCQmYDCJTx2hKVZolyAbDirQy6
	1u2ce8pCtjSYGY8ZgfLTjX2X++kir3VUntjvwNtuYeAgXGTAmrztZwsLwqYHBiqXH16yg0Xsg5do4
	6tg029pOknATrHl/2MCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFi-00000007I1Z-1NiP;
	Fri, 07 Aug 2026 07:44:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFe-00000007HyQ-2k3p
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:44:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b966dd74so18579605e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088661; x=1786693461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMXlhNjfgEVVavursvLkrVBWqQ3YchqAgG6nIZuSJdI=;
        b=VY7EtagmMcKtcpyKfKmQLLZTjfVKefWpJVzfr+mBm7ksTD/4cCKu0mLdJycOWvD5xz
         W9yC/qCqlImyqk1v/Y48kOo6VZC/UGnUtrHZRAeyheHGeorUSIIV4H37kx7hLe5YuDUY
         8233xCTdV6H2H7CrEPZrqhYouFl7K9EZpmZrJEyDvG65Qx2Y3yuz15zY4nzjDQmfPsaM
         nCTW9cf+HPqTK+rhxZ25xodyp7Z45z3WkGjsBSHy9lb9maFtkCj8EGoSVBF6Ua/EZ5YX
         wr82mlateN90zqueXBNoAWJKQyL6x2EtscCXNtc/DXRWVD9FVOvwdNtczMCJ/M2fwtHp
         7VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088661; x=1786693461;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMXlhNjfgEVVavursvLkrVBWqQ3YchqAgG6nIZuSJdI=;
        b=O+Xec9rdyqb6dMyl58khFM5L2/NIea0UjieVr7EdKL/CB02nU1NRhxrxjZDF5bYnWu
         W5iJm3D5IOY7K8xWT08Yf0+yHm5/mYY+Da5TNBAaWnBKkJRpNh6RpqpQ+rKoOKOcGJCo
         jSCmGz6z7O3XENr4zoj+BH7Fp0slLCA8Z8RI1HaWIznAo/kZHZoz8EhzW119Urunoy9/
         gAlz/544sFb8ph7RJsFbdGurYaD6Ty+s2RiJwiTUTV64VIzDLXPIofq3zBTXiAXRZWD9
         HVC5DGpGDeoZxxRIix5IIHhg9N836eHuWDYcV5NYb0y7gbyKta4CNjtYrenwa/rm5n5W
         TWVg==
X-Forwarded-Encrypted: i=1; AHgh+RppVrJIcnUdEPJF4PGfwp+NIzj9DfpAkhZTDLWnes2S/LQq+rq3KN0FRLXOIBD9xJ78Cdx3fH6A9EzkTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKPWMMQc34ksTaJHkK4z8M4rk3fSwu7A0miMvD6SOddC6vN2Xl
	G6QEb49gvkS115FqBYlpyynosiRYhX5e+bsX+o5wukVZDXhm+i7gmdhyv/jmpw7HZqN3
X-Gm-Gg: AR+sD12VP4f2PqV/sceE39/AenR5gbiS8BKos2jtQlwVtCgrS89DHrzXoIgMdxtnByi
	Oq7+qpGtS9GIUUczWYA5BV6DmVywOU41FDq3qDFyrvrCNfuiqrdc2w8Rd8juNPJOzdqOd82g0Jo
	N+sge4HbKExPYKVjzsK2Ee1p/6paXXn9T0HnMM7drCylDvX+fvRgw6q5hChhmQ1sKDRU0tjlXfY
	koM4qgFiolhDLBVETNXIbxpZ1G+ySQMTaShLDFQrjCPp4nOzVhcpUv1qgbw9cK4iStqk9cUviaB
	oOX2JwBDrqAqbxomnKzz+8T6cSU1B8uXA87eQ1pCnNE3QDjpD1OVAsg1BLFWFktO3o/DL/MbxFn
	po56XTq+BtNiaisD5UCyqImRActfxXl5wfAuplFHSRXoMT6bsgSRwaNJH3Ud4PYj+xyeSsrwpuw
	Tm/tZp4t/uvnS+PiJMFy01dXDrI92m6YvuCYkhoSUHujiFAMyl1aI2dIsiYboc9tWCQN5ONHsSV
	vQzefBewUfQNLPLkuq+ZP0we4i6OeAkSg==
X-Received: by 2002:a7b:ca4d:0:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-4994e7eb2d2mr211693395e9.19.1786088660739;
        Fri, 07 Aug 2026 00:44:20 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9eb1a0sm17092015e9.5.2026.08.07.00.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:31 -0700 (PDT)
Message-ID: <c4c81fcd-fc3c-4133-bad8-fed256617fc0@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
To: Greg KH <gregkh@linuxfoundation.org>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
 <2026010704-heaviness-quality-f543@gregkh>
Content-Language: en-US
In-Reply-To: <2026010704-heaviness-quality-f543@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004422_706946_7ED25546 
X-CRM114-Status: GOOD (  14.52  )
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

Ck9uIDEvNy8yNiAxOTozNiwgR3JlZyBLSCB3cm90ZToKPiBPbiBXZWQsIEphbiAwNywgMjAyNiBh
dCAwNDoyODoyOFBNICswMDAwLGpvYW9wZWl4b3RvQG9zeXgudGVjaCB3cm90ZToKPj4gRnJvbTog
Sm/Do28gUGVpeG90bzxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+Cj4+Cj4+IE1vdmUgdGhlIElQQyBz
aGFyZWQtbWVtb3J5IGh5cGVyY2FsbCBJRCBmcm9tIGFyY2hpdGVjdHVyZS1zcGVjaWZpYwo+PiBo
ZWFkZXJzIGludG8gaW5jbHVkZS9saW51eC9iYW8uaC4KPiBUaGF0IHNheXMgX3doYXRfIHlvdSBk
aWQsIGJ1dCBub3Qgd2h5IHlvdSBkaWQgaXQgOigKPgo+IEkgaGF2ZSBubyBpZGVhIHdoeSB0aGlz
IGlzIG5lZWRlZCBhdCBhbGwsIHNvcnJ5Lgo+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvw6NvIFBlaXhv
dG88am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgo+PiAtLS0KPj4gICBhcmNoL2FybS9pbmNsdWRlL2Fz
bS9iYW8uaCAgICAgICAgICAgfCA1ICsrLS0tCj4+ICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9i
YW8uaCAgICAgICAgIHwgNSArKy0tLQo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYmFvLmgg
ICAgICAgICB8IDcgKysrLS0tLQo+PiAgIGRyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0vaXBjc2ht
ZW0uYyB8IDUgKy0tLS0KPj4gICBpbmNsdWRlL2xpbnV4L2Jhby5oICAgICAgICAgICAgICAgICAg
fCAzICsrKwo+PiAgIDUgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9iYW8uaCBiL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2Jhby5oCj4+IGluZGV4IDVlY2U5ZWNiMTQ1NS4uN2QxMzU5MWZl
NjY5IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9iYW8uaAo+PiArKysgYi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9iYW8uaAo+PiBAQCAtMTYsMTQgKzE2LDEzIEBACj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2FybS1zbWNjYy5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9iYW8uaD4KPj4g
ICAKPj4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBiYW9faXBjc2htZW1faHlwZXJjYWxs
KHVuc2lnbmVkIGxvbmcgaHlwZXJjYWxsX2lkLAo+PiAtCQkJCQkJICAgdW5zaWduZWQgbG9uZyBp
cGNzaG1lbV9pZCkKPj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBiYW9faXBjc2htZW1f
aHlwZXJjYWxsKHVuc2lnbmVkIGxvbmcgaXBjc2htZW1faWQpCj4gVGhpcyBkb2VzIG5vdCBtYXRj
aCB3aGF0IHlvdSBzYWlkIHlvdSB3ZXJlIGRvaW5nIGluIHRoZSBjaGFuZ2Vsb2cgOigKWW91IGFy
ZSByaWdodCBvbiBib3RoIGNvdW50czsgdGhlIG1lc3NhZ2Ugbm93IGV4cGxhaW5zIHRoZSB3aHkg
YW5kIG5vIGxvbmdlcgpoaWRlcyB0aGUgc2lnbmF0dXJlIGNoYW5nZToKCiDCoCB2aXJ0OiBiYW86
IGNvbnNvbGlkYXRlIHRoZSBJUEMgaHlwZXJjYWxsIElEIGluIGluY2x1ZGUvbGludXgvYmFvLmgK
CiDCoCBUaGUgSVBDIHNoYXJlZC1tZW1vcnkgaHlwZXJjYWxsIElEIHdhcyBwYXNzZWQgYXMgYSBw
YXJhbWV0ZXIgdGhyb3VnaCBlYWNoCiDCoCBhcmNoaXRlY3R1cmUncyBiYW9faXBjc2htZW1faHlw
ZXJjYWxsKCkgYW5kIGRlZmluZWQgbG9jYWxseSBpbiAKaXBjc2htZW0uYy4KIMKgIERlZmluZSBp
dCBvbmNlIGluIGluY2x1ZGUvbGludXgvYmFvLmgsIG5leHQgdG8gdGhlIFJlbW90ZSBJL08gCmh5
cGVyY2FsbCBJRCwKIMKgIGFuZCByZWZlcmVuY2UgaXQgZGlyZWN0bHkgZnJvbSB0aGUgYXJjaCBo
ZWxwZXJzLiBBcyB0aGVyZSBpcyBvbmx5IG9uZSBJUEMKIMKgIGh5cGVyY2FsbCwgdGhpcyBhbHNv
IGxldHMgYmFvX2lwY3NobWVtX2h5cGVyY2FsbCgpIGRyb3AgaXRzIGh5cGVyY2FsbF9pZAogwqAg
cGFyYW1ldGVyLgoKU2VlIGFsc28gbXkgcmVwbHkgdG8gQW5kcmV3IG9uIHRoaXMgcGF0Y2ggcmU6
IHdoZXRoZXIgdG8ga2VlcCBpdCBzdGFuZGFsb25lCm9yIGZvbGQgaXQgaW50byB0aGUgZWFybGll
ciBwYXRjaGVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
