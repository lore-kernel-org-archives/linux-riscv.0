Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A5C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QvpiziSDkA4GP74m/MSQb1s8UkeEUauVn7176OlbM0=; b=wUWY+FjE0rm95Z
	rV3nGNtM0lHrdEhhfi9uL8x9npWxsE5APPQybcGEt7zjt4ce9gsd6RGXsuWjbQgTXZAV40wmlH0rZ
	bRvoca9K1lli0mtwuGeWderpdhJ66qb2BxSv7+zNWlR6ECeNsCN7pHux7BJ4MiRHXCQ/7GqfTs/gr
	VXEeHFSiV+h24GqZIQRtFV7Ekuju5lGLl3WZAjPQb9pYFCSmy2C9UP5GGbm6wRn41M/5vrgK/nEVU
	cW6J25Z6KI92RMsieazPdUAq4PrVkIztgkJbO4VE/t6ZkeEusMrPHIY5+ifbiz5ADDcKtT7CPQqVh
	ZCzOrIz+ZpV4OgxAOSHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFv-00000007I8e-1uz0;
	Fri, 07 Aug 2026 07:44:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFt-00000007I7c-2zmS
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=; b=efa9WPVuB1b2L9sGU5aFpTKARG
	lwif+auP1vqIDyfUJJ4LqPLSsRUW8+SN5JqB8yxXM+CwrAoQgKvpaM0jPBZucVD4frhIjcL5Bf3EB
	lvZeN3vDQgTadAgiYIYRXd/ZIGdvaDTL1/3kjXog9t086vcTK/SMktB+Ql/nwi1rtDrV/dmREjBij
	qZMh+FvvQBTd0wNVM0KR4zsbYC+GbYsdHcptqjI6pgWMUSaFZCVaJB/QCc4uho1tdwSN+YTOQJp+L
	6mDC2ersg5qNs65VJr0F5f/iWQYGD4eQXwIWyQV4/rowSQORf+kpTJIZtLo0hakQk8UM6QalQIsG5
	Hs49XsXQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFFq-0000000C9Zr-2taP
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:44:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4956242332dso23770155e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088673; x=1786693473; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=;
        b=wDARlYXwSgBTM0yDCryoyhY6mL13aCPPQzsFcpkzoqxoaPUnjJj754Bj5kgxY7YC5i
         Yr6jFqOKaRW18F98s7Nn1wksVs5HrM+uF4sYaXQEekkkvvIuFL7+M1KxPw+VLqhFsZwN
         NX9eV85+zFiMhwAZY7SIDh2pW95mF/Oi1QyLjRAx31KUCpD6sJt/piDwo5igzgSQCzHI
         dWSrRvtr6ijhd1+TUyTadvpMEiWF5KCXhYPdpzkLDOzYrDev1NSAmZlzE/KFIwtzgiPo
         LscyQW5dJYaW0JL3G+u64Fv7MvWIvzgv52hmAtIL053c74Hwu7TaN1eoHv3/gRxBmGH/
         a5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088673; x=1786693473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=;
        b=hBWS8jXcCK+8Q/vkD3MdqNj4EjWN4c7JMNVZuKi/T8lt1jcHqLYoljOanGJ0l+mynh
         1v7oVT/i6t65FfldljbN3+2zWHAWqeXtbyonOaqMzqt7W9gsmDfXHQDHgg0ok5YOLY+y
         QCG95JzyWOrshFdOsupAQV5zlN1ucqBnCVdD6d1DVdmM9ivaNp+f9/4Ws0fBx7SeGzH/
         mcIcC/vPZtEbCSq6BDWNSFdAFQ/RjX9EjIFgDmdMIrXUlMR8+TaPZUv3P1nREgjeuvN8
         PsEedraNMqvw8AQXNlMVQp459eE9POJ4nFNiIavOZE8XyyJHyIBz3XAoyCTFAn898l6y
         zczg==
X-Forwarded-Encrypted: i=1; AHgh+Rptdt68s34qvuyvCAl9S3b/soq52FDQfOcGVqbJ4sfIoavuPtq/F+fjPUCjJUCkiVh3HMRufYikeMlh3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnX5usYFrPadniJFb00k8xQIPfTR7t4ujBN41LGH2nWwCiio8
	9Dy8Arx39Rjz4+Dk9mfGbS/ff+DJ5It5Kdwcyz/ZJt9d5fLsDqQvXwnM/ijv9pHD/GWq
X-Gm-Gg: AR+sD1362VLwOp+H+8UXb/DjWsnbcTZhGSlVZjx3/P9xzogdx3afZfFHCE/8NMvWrrO
	bpXWUpgdczxRAhdij0QTfwACDH9jmLzVy6RWf4AT1hAbpAilJrnIGqjhNfnOYzleXBj6k0DOBfC
	FYs77mEctT33P9oSeTSML38egaVCi1UaSi15jv9SpQl3IAzHmrmyGGYNR2C9nqPF9nWP0DobI0X
	cOYH+3plAWtGBoMG7K8CqVI0GxwrC+weO7BfN4Ex0SqR2NZ7MzPdt/kQEI9bamAxCUl17TWoBsS
	g6FaZabUUAMfAwyunTUgfJoZG7/Ad0IChwT/175g9aP7koQadYVAPCMK9H9oUCXUKI0Cu7p2Kqd
	ikywIAY6fxV1jKfZmJKu3J+P6QkxMdGwx8/wIfhdAJzJT5WWIGM7gH4h2PWVQ0hQLNNaY8bV2Y7
	bGYnaCs+PFqOIjnu9tXuekZYgGCtoC5HiXoeGxnE0QDrH7XiLkllzPkkCUtp1eIFdXS8g9hcplU
	iLniFd7QHAssI3bY3YloCWApd1LN3ZfPQ==
X-Received: by 2002:a05:600c:46ca:b0:499:5e50:5be9 with SMTP id 5b1f17b1804b1-4995e505da9mr18485315e9.16.1786088673162;
        Fri, 07 Aug 2026 00:44:33 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7a56c5sm40919585e9.3.2026.08.07.00.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:44:31 -0700 (PDT)
Message-ID: <96442d4d-ec8c-4637-89a2-9dcbca7bb98b@osyx.tech>
Date: Fri, 7 Aug 2026 08:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
 <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
Content-Language: en-US
In-Reply-To: <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084435_054609_C64BD66B 
X-CRM114-Status: GOOD (  11.53  )
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

Ck9uIDEvMTQvMjYgMjA6MzQsIEFuZHJldyBKb25lcyB3cm90ZToKPiBPbiBXZWQsIEphbiAwNywg
MjAyNiBhdCAwNDoyODoyOFBNICswMDAwLGpvYW9wZWl4b3RvQG9zeXgudGVjaCB3cm90ZToKPj4g
RnJvbTogSm/Do28gUGVpeG90bzxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+Cj4+Cj4+IE1vdmUgdGhl
IElQQyBzaGFyZWQtbWVtb3J5IGh5cGVyY2FsbCBJRCBmcm9tIGFyY2hpdGVjdHVyZS1zcGVjaWZp
Ywo+PiBoZWFkZXJzIGludG8gaW5jbHVkZS9saW51eC9iYW8uaC4KPiBUaGUgc2VyaWVzIHNob3Vs
ZCBiZSByZWJhc2VkIHRvIGhhdmUgdGhpcyBmaXh1cCBpbnRlZ3JhdGVkIGludG8gdGhlCj4gcHJl
dmlvdXMgcGF0Y2hlcyB3aGVyZSB0aGUgY29kZSBpcyBmaXJzdCBpbnRyb2R1Y2VkLgo+Cj4gVGhh
bmtzLAo+IGRyZXcKVW5kZXJzdG9vZC4gVGhlIHJlYXNvbiBpdCBpcyBjdXJyZW50bHkgYSBzZXBh
cmF0ZSBwYXRjaCBpcyBsYXllcmluZzogdGhlCnNoYXJlZCBoZWFkZXIgaW5jbHVkZS9saW51eC9i
YW8uaCBpcyBpbnRyb2R1Y2VkIGJ5IHRoZSBJL08gZGlzcGF0Y2hlciBwYXRjaAooNC82KSwgd2hp
bGUgdGhlIElQQyBoZWxwZXIgdGhhdCB3b3VsZCB1c2UgdGhlIGNvbnN0YW50IGlzIGludHJvZHVj
ZWQgCmVhcmxpZXIKKDIvNikuIFRvIGZvbGQgdGhpcyBhd2F5IGNsZWFubHkgSSB3aWxsIG1vdmUg
Y3JlYXRpb24gb2YgaW5jbHVkZS9saW51eC9iYW8uaAppbnRvIDIvNiAod2l0aCB0aGUgSVBDIGh5
cGVyY2FsbCBJRCkgYW5kIGhhdmUgNC82IG9ubHkgYWRkIHRoZSBSZW1vdGUgCkkvTyBJRCwKc28g
dGhlIGFyY2ggaGVscGVycyBhcmUgcGFyYW1ldGVyLWZyZWUgZnJvbSB0aGUgc3RhcnQgYW5kIHRo
aXMgcGF0Y2gKZGlzYXBwZWFycy4gSSB3aWxsIGRvIHRoYXQgaW4gdjQgKEkga2VwdCBpdCBzZXBh
cmF0ZSBpbiB2MyBvbmx5IHNvIHRoZQpjaGFuZ2Vsb2cgYWdhaW5zdCB2MiBzdGF5cyByZWFkYWJs
ZSwgYW5kIGl0IG5vdyBoYXMgYSBwcm9wZXIgIndoeSIgbWVzc2FnZSkuCklmIHlvdSB3b3VsZCBw
cmVmZXIgSSBmb2xkIGl0IGltbWVkaWF0ZWx5LCBJIGFtIGhhcHB5IHRvIHJlc3Bpbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
