Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023C3CD5BAB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 00:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILZPM5jy+zPGJZMageJfgOn8M+OK3nnevCYUByo/0X0=; b=zuyReTr8Kw7KX4
	EVQPtgBxFjbIgiYtMWZHEy9esgM/PNpgFA4vS/3MFLfVmRbz5k1u+jcZTRm4JGUy/YXumXz8x3UVf
	KPT/mvhc5cW0wBzyZWsTcZm4QdCQIfrhan52D0NpkugbjL+0Qvmj31TZc+j68uwzZ6yL9hldYUYTE
	5Gc1vHCnkKBBTIwgAvZnPpO6xi2WqaS2+D/GBCZCvMzKvTGF4aStThsVifC6RuzaAuglJZyCi67T9
	AQe4p4acE6eMdoUz2Z8xiToqDpanr6f0zjjDGKC7aFDSMyVMxpT1bJrAzmhbQzMx8TkzGgbgPPG+O
	BJqoc5kEzI/DgszqjN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDjY-00000009P37-1fVC;
	Fri, 22 May 2026 00:27:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDjV-00000009P2C-2hLh
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 00:27:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso50695595e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779409639; x=1780014439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ay5nOcwCJCKL9kJTKSvIioIW4guYTs+JXkN6Y689XM=;
        b=GHYhOr2it3LnK8lGChb8cpmpB6+pOPwBCTBaTh6YGFaR9VyGcTfkp1iewY35QcwvHT
         QGypqHvN0EauhxCsiU4tYCDIDxb9o4daWPCUrUROwNgNPhiOVdhUeFBwm4M9608R4VOg
         uGpitN0USI9e5AELO0s80Am6IpTJTY+p/4/mpXKYmK3GXD8Zs3Wh0TDqj3n0VKGRpS1r
         FnpwveK1dacrziEft/jpCezOFTS3MRErH32TmTi2ybpbEBKOIo/nY583Ib9mFYvT7+wN
         oY0MUy3slrL1agc5SAXJ2BjoCveahhSenCTkuqK1iAkzog/nckxLhAGpJvpiHY5bCwIW
         E+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409639; x=1780014439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ay5nOcwCJCKL9kJTKSvIioIW4guYTs+JXkN6Y689XM=;
        b=rXSEdjZlnKTKMuVJieTFTxyjdiQDqmXaKheoAQQQKOZT4cPAp0xCgUq6Oj8+VGQNq5
         LIMUSkRw5lcRR9gTFdZkg0BNxbi0DNcR1fDzyiLG5IdGOZYw1Mw63kqN/RhfdOIFz92s
         R5p/ORTR6wRqhckHvUDRdcIwUxRJbAiSna5EbHk4Zp3Y12AOpoHTHLgwfszlkVzD0lot
         ItXxCDhF0nbdVOJ3G61AiFY19ZTjZWjKRrVofuC0VX4Bqp3kbUCf2i4BmmgrBwAQcl2j
         Vvjuuh2MvdBp/Zn0CLFQtyPLM8UWZ1kgWwpMAaxc8N/6PZ1qZXaLtwleMXcbamJBku8q
         Vh3A==
X-Forwarded-Encrypted: i=1; AFNElJ/ruOFCU6uUMimWs86Nb8ZaAFgWZg+v2/TemTD2qv2+PJvgs9u4I1DPxOL1WO8efvs4AKNcHqd+e9YgnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxtGUGVwGbXGNBnXiBgprWh3QdnIx2tWRycBJ35Gg7nkaZ8vRm
	4aIVa4cq6iWJuNVZg8P8NsHkQKByz/Po7qH91bSx9mPRx3ecIEJF0RBW6Gbd3XycLyU=
X-Gm-Gg: Acq92OGzwh9fq0CCDlqqVUfnFqQYq39gWu9YW80kJMZAIlAOPlzgGTRTpjw9VCw85bv
	WsQCoo2FFAqcI/dk7gbVl3OQjbp9q4UAWKO3tl7Q2AvxnAv4JeZMofrVNdLy6EFIEhYnN8JhoMM
	J4g392tUiMZRILIYJyqFtfpJ5RQuBSAS5q2MAjuF5JsbgSPStZ/hgAutFxO0+uO4Ho4ZgDgHS09
	oIyC4l5UD6wWmd0xxZfsdcbJe4sKaZd9IPK6YPT21IyU2syL3rI8uniuXuCMC5uql3Ss4vboEyw
	SO90JrCREE1bShuhFip68atSGlI/0He9yEwEzI1bbCRpgknwcEtF5ANPgv/Ele02cBVzICVWGHV
	3GhUKCJd3RTbI51oShnr95A82p/mypZgy1JJd11mX2IZk4EJo6PvV/JUQpIZVCGDUYeajsZ1aDU
	EvwrH/D1e1ZGBFdH+hrQ4Ukr0r1sZd7Wc62IVQpeNzLwUNNcDe6IZLlsXl6slVDnnLGfstYJZf4
	7X69R3RbqbPxUw1JQCSsugOem5HUre0OXkEVa1ztenNtI+GoESRTn/ECg==
X-Received: by 2002:a05:600c:4ecc:b0:490:3c90:2cda with SMTP id 5b1f17b1804b1-490426cef73mr10709345e9.20.1779409638952;
        Thu, 21 May 2026 17:27:18 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1:0:2bb5:f164:6e6a:38d8? (2403-580d-fda1-0-2bb5-f164-6e6a-38d8.ip6.aussiebb.net. [2403:580d:fda1:0:2bb5:f164:6e6a:38d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0f91bccsm4187125ad.36.2026.05.21.17.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 17:27:17 -0700 (PDT)
Message-ID: <cced8d26-d846-470d-b112-344e53ec1b9c@suse.com>
Date: Fri, 22 May 2026 09:57:00 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
To: Andrew Morton <akpm@linux-foundation.org>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Christoph Hellwig <hch@lst.de>, "H. Peter Anvin" <hpa@zytor.com>,
 kreijack@inwind.it, David Sterba <dsterba@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Song Liu <song@kernel.org>,
 Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
 Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-raid@vger.kernel.org
References: <20260512052230.2947683-1-hch@lst.de>
 <20260512052230.2947683-2-hch@lst.de> <20260512114231.GG2558453@suse.cz>
 <20260513054742.GA1018@lst.de>
 <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
 <20260515043705.GA3855@lst.de>
 <34C16854-1065-4542-8836-DDED58EC1844@zytor.com>
 <20260518051207.GB9374@lst.de> <f46636c8-80ba-4802-a6a0-74cbc35e7bee@gmx.com>
 <20260521171730.7872482df453975cf60ce7dc@linux-foundation.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20260521171730.7872482df453975cf60ce7dc@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_172721_706515_2F7E3D50 
X-CRM114-Status: GOOD (  16.70  )
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

CgrlnKggMjAyNi81LzIyIDA5OjQ3LCBBbmRyZXcgTW9ydG9uIOWGmemBkzoKPiBPbiBXZWQsIDIw
IE1heSAyMDI2IDE4OjExOjA5ICswOTMwIFF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNv
bT4gd3JvdGU6Cj4gCj4+Cj4+Cj4+IOWcqCAyMDI2LzUvMTggMTQ6NDIsIENocmlzdG9waCBIZWxs
d2lnIOWGmemBkzoKPj4+IE9uIEZyaSwgTWF5IDE1LCAyMDI2IGF0IDEyOjU5OjM0UE0gLTA3MDAs
IEguIFBldGVyIEFudmluIHdyb3RlOgo+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIGdvb2Qg
aWRlYS4gRXJyb3Igb3V0OyBpdCBpcyB0aGUgYnRyZnMgbWFpbnRhaW5lcnMnIGpvYiB0byBlbnN1
cmUgdXNlciBkYXRhIGlzbid0IGxvc3QuCj4+Pj4KPj4+PiBUaGUgUkFJRC02IGNvZGUgaGFzICpu
ZXZlciogc3VwcG9ydGVkIG9ubHkgMyB1bml0cywgYW5kIGlmIGl0IGV2ZXIgd29ya2VkIGZvciAq
YW55KiBvZiB0aGUgaW1wbGVtZW50YXRpb25zIGl0IHdhcyBwdXJlbHkgYnkgYWNjaWRlbnQuIFNw
ZWFraW5nIGFzIHRoZSBvcmlnaW5hbCBhdXRob3IgSSBzaG91bGQga25vdzsgdGhpcyB3YXMgZGVs
aWJlcmF0ZSBhcyBpbiBzb21lIGNhc2VzIHRoZSBkZWdlbmVyYXRlIGNhc2UgKDMpIHdvdWxkIGhh
dmUgcmVxdWlyZWQgZXh0cmEgdHJheXMgaW4gdGhlIGNvZGUgdG8gbm8gdXNlciBiZW5lZml0Lgo+
Pj4+Cj4+Pj4gSSB3b3VsZCBub3QgYmUgc3VycHJpc2VkIGlmIHRoZSBrZXJuZWwgY3Jhc2hlZCBv
ciBjb3JydXB0ZWQgdGhlIHBhZ2UgY2FjaGUgaW4gdGhhdCBjYXNlLgo+Pj4KPj4+IEl0IGRvZXMs
IHRoYXQncyB3aHkgSSB3YW50ZWQgdG8gZXhjbHVkZSBpdC4gIEFueXdheSwgZm9yIHRoZSBhYm91
dCB0byBiZQo+Pj4gcmVzZW50IHZlcnNpb24gSSdsbCBkcm9wIHRoaXMgYnRyZnMgcGF0Y2ggb3Zl
ciB0aGUgc3RhdGVkIG9iamVjdGlvbiBhbmQKPj4+IHdpbGwgb3RoZXJ3aXNlIG5vdCBjaGFuZ2Ug
YW55dGhpbmcuICBUaGlzIG1lYW5zIHRoZSAoSU1ITyBoeXBvdGhldGljYWwpCj4+PiB1c2VycyBv
ZiB0aGlzIGNvbmZpZ3VyYXRpb24gd2lsbCBnZXQgYSBXQVJOX09OX09OQ0UgdHJpZ2dlcmVkLCBi
dXQKPj4+IG90aGVyd2lzZSBrZWVwIHdvcmtpbmcgKG9yIHJhdGhlciBub3Qgd29ya2luZykgYXMg
YmVmb3JlLgo+Pj4KPj4KPj4gRm9yIHRoZSBidHJmcyBwYXJ0LCBJIGJlbGlldmUgSSBjYW4gZ2V0
IHRoZSBjdXJyZW50IDItZGlzay1yYWlkNSBhbmQKPj4gMy1kaXNrLXJhaWQ2IHRvIGZhbGxiYWNr
IHRvIHJhaWQxIGluc2lkZSBidHJmcy4KPj4KPj4gSSBob3BlIHRoZSBidHJmcyBwYXJ0IGNhbiBi
ZSBmaW5pc2hlZCBhbmQgcmVhY2ggdGhlIG5leHQgbWVyZ2Ugd2luZG93LAo+PiBidXQgSSdtIG5v
dCAxMDAlIHN1cmUuCj4+Cj4+IFdoYXQgaXMgdGhlIHBsYW5uZWQgY3ljbGUgdG8gbWVyZ2UgdGhp
cyByYWlkNS82IGNsZWFudXA/Cj4gCj4gQXQgcHJlc2VudCBpdCdzIG9uIHRyYWNrIGZvciB0aGUg
Ny4yLXJjMSBtZXJnZSB3aW5kb3cuICBEb2VzIHRoYXQgc3VpdD8KClRoZSBjdXJyZW50IGJ0cmZz
IGZpeCAoKikgaXMgcHJldHR5IHNtYWxsLCBJIGJlbGlldmUgd2UgY2FuIGdldCBpdCBpbnRvIAp0
aGUgbmV4dCBtZXJnZSB3aW5kb3csIGFzIGxvbmcgYXMgd2UgZ290IGVub3VnaCByZXZpZXcgb24g
aXQuCgoqOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYnRyZnMvYTFkNjM3MzM0NjUy
Mjk5MzYzNTE4MDRmMzc2MDgwM2Q1ODk0YTk2Mi4xNzc5Mjc0NjMwLmdpdC53cXVAc3VzZS5jb20v
VC8jdQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
