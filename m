Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D902AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5whcp/4mQp5JqUN78wvmwSNK7bvtJA4Cs/DGEFK0sw=; b=F1izyFXVav3GZG
	FAvK5GDw/5+gL13C/3jl/StVd1yb8pG4C6d0XG8Ol6d+4ADlheRKQAosHt5H5eysbsA53vg2Ll/Cu
	UEbhYKT6Go3BZy/+yZcvwA3ktf5P/ixGr0kgb/atkyg0ZdNwmWMzb3RRyWQzAIPR+wjDKTjswC989
	wbhZOTER/LyO+VePumlXYnsUOYPyu6lU+hBuYZJaNNhFZ3snfHgB+ZUpD3We6tHgCwFWI3qW+H1fI
	1LiYgmBrhz+NUmqts/VqbmLKBus4otpYS5UeJsibKWFn/8ANG39JbmZ8ZDTW0FiAvNS78BzVnABhk
	hoDi0v4/TkAWWoVVDWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rhH-006oiq-FS; Mon, 12 Dec 2022 22:54:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rhE-006ogs-Re
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 22:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670885691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5SuLNwdZHpl5E44bqXulIn8ful04ZsB1bGOr0Kxg/E=;
	b=D/1HCFD1bRDB0gU698q3qYSbWeb3s/HgdtnRBN6e67iiGSiBbjDbJJyeCurUhhjRkhLRyd
	cnM6Zyu3Q0gdGF2ZjxQbFr6mT26GiVynSpfEb+AXGF/A8miriBTkG8nA81knUvo+PIdK87
	g9jwfDHwakfuUT9WT8VaS3yA+MnTu0I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-292-0MN-DRWeMa20BOcSa9hmxA-1; Mon, 12 Dec 2022 17:54:48 -0500
X-MC-Unique: 0MN-DRWeMa20BOcSa9hmxA-1
Received: by mail-wm1-f71.google.com with SMTP id h81-20020a1c2154000000b003d1c8e519fbso4748885wmh.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 14:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5SuLNwdZHpl5E44bqXulIn8ful04ZsB1bGOr0Kxg/E=;
        b=gbTms9C6EfxcRqMX5O1J33wz7Q8URlCpPYezt8QleaAHcaNIeDIhaF7gsi2QWz/To0
         v0QXh4ZqjWeAKJsc+P2w98l6MvXCYdRNDvrY31CviTkukoqIHNMlEGcfPHhcjPyq7wBO
         TeuctNMBpyMe6VRdH5ssTne0DbxrufJlp5mHnCQrx+scYKh2snj09L6lnNpctfcLh3H+
         6wZ9RPb/aQz0N+sMpiBoMYB2Jy5it+nNCWuXZZYSAxwqVnupaslzJwZbf18aOEftYUMw
         3TT2W/GeWWePSLbmDPUeGAtZbSgqssddovvWoD2cs7US8zQcECTYAPWXfpm9/RUwk8K2
         zL/A==
X-Gm-Message-State: ANoB5plHvRSyeU+J1hNfobl0k8a1GgvJK2zq1lZJk3eQKDJnA8Hx8xri
	my1IxiicFywZcks8X6IwghM6zgMLP4dVOGrnoX9iEmZkqwDOKjAfn4TCfH7IzkYtP7mGE4wx3hJ
	B1OXc92Od8LvVcC72NRyWlGCipusD
X-Received: by 2002:a05:600c:4891:b0:3d1:fbf9:3bd4 with SMTP id j17-20020a05600c489100b003d1fbf93bd4mr13513704wmp.10.1670885687615;
        Mon, 12 Dec 2022 14:54:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7KvFoJFh/xdI6Uil+R/sBcLTOuYWBFn5UTZm2GDLG0lMDUVKnPmisnw/N8nz6QJ1gfZ6zvaw==
X-Received: by 2002:a05:600c:4891:b0:3d1:fbf9:3bd4 with SMTP id j17-20020a05600c489100b003d1fbf93bd4mr13513681wmp.10.1670885687379;
        Mon, 12 Dec 2022 14:54:47 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id h7-20020a05600c314700b003cfd4a50d5asm12200704wmo.34.2022.12.12.14.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:54:46 -0800 (PST)
Message-ID: <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
Date: Mon, 12 Dec 2022 23:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit
 <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>,
 Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
 Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
 Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
 Krish Sadhukhan <krish.sadhukhan@oracle.com>,
 Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20221208193857.4090582-1-dmatlack@google.com>
 <Y5OHVzBSHPmAq2FO@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
In-Reply-To: <Y5OHVzBSHPmAq2FO@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_145452_986577_34F93E7A 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvOS8yMiAyMDowNywgT2xpdmVyIFVwdG9uIHdyb3RlOgo+PiAgIC0gTmFtaW5nLiBUaGlz
IHNlcmllcyBkb2VzIG5vdCBjaGFuZ2UgdGhlIG5hbWVzIG9mIGFueSBleGlzdGluZyBjb2RlLgo+
PiAgICAgU28gYWxsIHRoZSBLVk0veDg2IFNoYWRvdyBNTVUtc3R5bGUgdGVybWlub2xvZ3kgbGlr
ZQo+PiAgICAgInNoYWRvd19wYWdlIi8ic3AiLyJzcHRlIiBwZXJzaXN0cy4gU2hvdWxkIHdlIGtl
ZXAgdGhhdCBzdHlsZSBpbgo+PiAgICAgY29tbW9uIGNvZGUgb3IgbW92ZSB0b3dhcmQgc29tZXRo
aW5nIGxlc3Mgc2hhZG93LXBhZ2luZy1zcGVjaWZpYz8KPj4gICAgIGUuZy4gInBhZ2VfdGFibGUi
LyJwdCIvInB0ZSIuCj4KPiBJIHdvdWxkIHN0cm9uZ2x5IGJlIGluIGZhdm9yIG9mIGRpc2NhcmRp
bmcgdGhlIHNoYWRvdyBwYWdpbmcgcmVzaWR1ZSBpZgo+IHg4NiBmb2xrcyBhcmUgd2lsbGluZyB0
byBwYXJ0IHdheXMgd2l0aCBpdCDwn5iECgpZZXMsIGFic29sdXRlbHkuICBTb21ldGhpbmcgbGlr
ZSB0b19zaGFkb3dfcGFnZS0+dG9fbW11X2RhdGEsIHNwLT5tZCwgCnNwdC0+aHB0LCBzcHRlLT5z
cHRlLCBzcHRlcC0+aHB0ZXAuCgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
