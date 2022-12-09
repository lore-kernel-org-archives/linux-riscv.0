Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A638C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1ul1ZMxFT9NotWfljVxgoBNjyldx4Bq9jsc7A8YXrs=; b=d6jlZTyG7yK8Wy
	cdLJq5+JRVq8C8z9nO6lqeOldJ/Y1CiyscJNSVDOQzwgkwDvZR58t+lV9uDL00ljZU84+Lmwzi7li
	nIio+xmyicrFLN1MTUA1ZpOmE3sJe/HR+UGzHaCS+BWHhlmCPnwfdrAgKvMtqMvW8EiD0lMfvbUWI
	yqZnooKngXuOK4lH6a2KuqwanlGcfZdY/hezhZuwgdektuqvn4e+d5Ed1ISpsNm/fUN4VCMVue5Hf
	VwFts+m18VJNAB4hUiJf+o9/cZqDOnq92WSAV9xDuXIEP0MTMWjqAgmm9wm+6oZxr1PBy93ijjiS5
	9G6qWcRDvEV6l3z2xdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3jGL-00AspY-Lv; Fri, 09 Dec 2022 19:42:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3jGJ-00AsnQ-78
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 19:42:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id jn7so5912484plb.13
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 11:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sdh+OHaTkwVbiZvE0C8NICtGt7CceNsZBQVdmNDraAM=;
        b=mi2dqq6GAojBjnjxMAYvd2eyZXPZ6ibTL+Mdj/sIYNpN5+JdKNCKN9l9L+GunuBX3d
         VLn6bBU/ef3yiHdspi8tws4S2/bikyYzFz+HdbijHzRGPMJGpdrBnEtHXAn+e9rrM7e3
         8Uqd2CTKXuSlUQnWUaoC04caaX51zY+UfevVGPp8KjpEow4kHNwpj4pN32OT3+h3vfkQ
         07ppjedJ/KRWv70UlfBRa0BqRCW0Vx4fMTOd6I0Ijl3MvonkkKhaxyTLk3M2qxB5pyET
         U5x9GuRCCeKNZW7S+bsKC5c3vmRuuYGxUSKd8gpvD2ire1wttVXySKNkOxrI7qtTlaTp
         a/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdh+OHaTkwVbiZvE0C8NICtGt7CceNsZBQVdmNDraAM=;
        b=J0nQYepaO8jV48U8Qtf4shJa8ak7tjgc5ntx07x0Fv9mRdTHHaOvMLA0BBtSoRCZ/k
         93B7GdSv+IEjjLfug4YSpDRLEedb2f6OoxQyd5NH+Op9cBpLlBLuZEKvkQDfMX20kn9Q
         x7SqOHgpkU3OInjwEPGlIhs8RToE8oZzUOglLxJv9pjiqRiJr8mOq9qcZ8f5vrcXEIj6
         0c8ExcAyEqLW8lzJS3K6YgE97045TNhTpzAEv6vTw1YYcYIGI9WFkuuqjscaFrwF1wQp
         DSN3i/H3BJRSePOOCY/Y3YJLvTudApbU3u50l6TISKs1ybMYEDxAEBxAZDSiVciZPCJL
         XFiA==
X-Gm-Message-State: ANoB5pkXBOXWcoATZ6yqv289qZakrZ9NgsXbl/kfNRaU28eJD5CFhU1g
	NhnCZshSmDpU/0bXQCv8JTOYWQ==
X-Google-Smtp-Source: AA0mqf782NfywRPZ4oBo31wo7Bm6p+cVkRrwutod9Oz1na+ghn4AyzEKqVxqf0Bh3kjU1my8lOyTZw==
X-Received: by 2002:a17:902:aa81:b0:186:61b3:d507 with SMTP id d1-20020a170902aa8100b0018661b3d507mr6661923plr.43.1670614941488;
        Fri, 09 Dec 2022 11:42:21 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id w7-20020a170902e88700b00178aaf6247bsm1698631plg.21.2022.12.09.11.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 11:42:21 -0800 (PST)
Message-ID: <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
Date: Fri, 9 Dec 2022 11:42:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, fweimer@redhat.com
Cc: Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com,
 Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
 atishp@atishpatra.org, guoren@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 bjorn@kernel.org, libc-alpha@sourceware.org, christoph.muellner@vrull.eu,
 Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_114223_286768_81BB0D56 
X-CRM114-Status: GOOD (  37.07  )
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

Ck9uIDEyLzkvMjIgMDk6MjEsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIEZyaSwgMDkgRGVj
IDIwMjIgMDU6MDQ6MjMgUFNUICgtMDgwMCksIGZ3ZWltZXJAcmVkaGF0LmNvbSB3cm90ZToKPj4g
KiBEYXJpdXMgUmFkOgo+Pgo+Pj4gT24gRnJpLCBEZWMgMDksIDIwMjIgYXQgMDE6MzI6MzNQTSAr
MDEwMCwgRmxvcmlhbiBXZWltZXIgdmlhIAo+Pj4gTGliYy1hbHBoYSB3cm90ZToKPj4+PiAqIERh
cml1cyBSYWQ6Cj4+Pj4KPj4+PiA+IE9uIEZyaSwgRGVjIDA5LCAyMDIyIGF0IDExOjAyOjU3QU0g
KzAxMDAsIEZsb3JpYW4gV2VpbWVyIHdyb3RlOgo+Pj4+ID4+ICogQW5kcmV3IFdhdGVybWFuOgo+
Pj4+ID4+Cj4+Pj4gPj4gPiBUaGlzIHN1Z2dlc3RzIHRoYXQgbGQuc28sIGVhcmx5LXN0YWdlIGxp
YmMsIG9yIHBvc3NpYmx5IGJvdGggCj4+Pj4gd2lsbCBuZWVkCj4+Pj4gPj4gPiB0byBtYWtlIHRo
aXMgcHJjdGwoKSBjYWxsLCBwZXJoYXBzIGJ5IHBhcnNpbmcgdGhlIEVMRiBoZWFkZXJzIAo+Pj4+
IG9mIHRoZQo+Pj4+ID4+ID4gYmluYXJ5IGFuZCBlYWNoIGxpYnJhcnkgdG8gZGV0ZXJtaW5lIGlm
IHRoZSBWIGV4dGVuc2lvbiBpcyB1c2VkLgo+Pj4+ID4+Cj4+Pj4gPj4gSWYgdGhlIHN0cmluZyBm
dW5jdGlvbnMgdXNlIHRoZSBWIGV4dGVuc2lvbiwgaXQgd2lsbCBiZSBlbmFibGVkCj4+Pj4gPj4g
dW5jb25kaXRpb25hbGx5LsKgIFNvIEkgZG9uJ3Qgc2VlIHdoeSBpdCdzIG9rYXkgZm9yIGxpYmMg
dG8gCj4+Pj4gdHJpZ2dlciB0aGlzCj4+Pj4gPj4gYWxsZWdlZCBVQVBJIGNoYW5nZSwgd2hlbiB0
aGUga2VybmVsIGNhbid0IGRvIGl0IGJ5IGRlZmF1bHQuCj4+Pj4gPj4KPj4+PiA+Cj4+Pj4gPiBC
ZWNhdXNlIHRoZSBjYWxsIHRvIGVuYWJsZSBjYW4gZmFpbCBhbmQgdXNlcnNwYWNlIG5lZWRzIHRv
IGRlYWwgCj4+Pj4gd2l0aCB0aGF0Lgo+Pj4+Cj4+Pj4gRmFpbHVyZSBpcyB1c3VhbGx5IGluZGlj
YXRlZCBieSBhbiBBVF9IV0NBUCBvciBBVF9IV0NBUDIgYml0IHJlbWFpbmluZwo+Pj4+IHplcm8s
IG9yIHBlcmhhcHMgYSBzcGVjaWFsIENQVSByZWdpc3RlciAoYWx0aG91Z2ggdGhhdCBpcyBtb3Jl
IAo+Pj4+IHVudXN1YWwpLgo+Pj4KPj4+IFRoYXQgd291bGQgaW5kaWNhdGUgdGhhdCB0aGUgZXh0
ZW5zaW9uIGlzIG5vdCBwcmVzZW50LCB3aGljaCBpcyBvbmUgCj4+PiBvZiwgYnV0Cj4+PiBub3Qg
dGhlIG9ubHkgd2F5IGl0IGNhbiBmYWlsLgo+Pgo+PiBJIHRoaW5rIHlvdSBzaG91bGQgYnJpbmcg
ZG93biB0aGUgbnVtYmVyIG9mIGZhaWx1cmUgbW9kZXMuIEhXQ0FQIGhhcwo+PiB0aGUgYWR2YW50
YWdlIHRoYXQgaXQgY29tbXVuaWNhdGVzIGtlcm5lbC9oeXBlcnZpc29yL2Zpcm13YXJlL0NQVQo+
PiBzdXBwb3J0IGluIGEgc2luZ2xlIGJpdCwgd2hpY2ggc2ltcGxpZmllcyB0aGUgcHJvZ3JhbW1p
bmcgbW9kZWwgYW5kCj4+IGF2b2lkcyBoYXJkLXRvLWRldGVjdCBidWdzLsKgIEl0J3Mgbm90IGNs
ZWFyIHdoeSBpdCB3b3VsZCBiZSBiZW5lZmljaWFsCj4+IHRvIGNvbnRpbnVlIG9uIEVOT01FTSBm
YWlsdXJlcyBoZXJlIGJlY2F1c2UgdGhlIHN5c3RlbSBtdXN0IGNsZWFybHkgYmUKPj4gaW4gYmFk
IHNoYXBlIGF0IHRoaXMgcG9pbnQsIGFuZCBsYXVuY2hpbmcgYSBuZXcgcHJvY2VzcyBpcyB2ZXJ5
IHVubGlrZWx5Cj4+IHRvIGltcHJvdmUgbWF0dGVycy7CoCBTbyBJIHRoaW5rIHRoZSBzaW1wbGVy
IHByb2dyYW1taW5nIG1vZGVsIGlzIHRoZSB3YXkKPj4gdG8gZ28gaGVyZS4KPj4KPj4+IFRoZSB2
ZWN0b3IgZXh0ZW5zaW9uIHJlbGllcyBvbiBkeW5hbWljYWxseSBhbGxvY2F0ZWQgbWVtb3J5IGlu
IHRoZSAKPj4+IGtlcm5lbCwKPj4+IHdoaWNoIGNhbiBmYWlsLgo+Cj4gVGhlIGlzc3VlIEknbSB3
b3JyaWVkIGFib3V0IGlzIHRoYXQgViBuZWVkcyBtb3JlIHNwYWNlIGluIHRoZSAKPiB1Y29udGV4
dC10eXBlIHN0cnVjdHVyZXMuwqAgV2UgaGF2ZSBhbiBleHRlbnNpYmlsaXR5IHNjaGVtZSB0aGVy
ZSBzbyB3ZSAKPiB0aGluayBpdCBjYW4gYmUgbWFkZSB0byB3b3JrLCBidXQgSUlVQyB3ZSdsbCBu
ZWVkIGdsaWJjIHRvIGJlIHVwZGF0ZWQgCj4gdG8gaGFuZGxlIHRoZSBleHRlbmRlZCBjb250ZXh0
cyBpbiBvcmRlciB0byBhdm9pZCBsb3Npbmcgc3RhdGUgd2hlbiAKPiBkb2luZyB1Y29udGV4dC1y
ZWxhdGVkIG9wZXJhdGlvbnMgbGlrZSBzaWduYWwgaGFuZGxpbmcuCgpTb3JyeSB0aGlzIGlzIG5v
dCByZWxldmFudCB0byB0aGlzIHRocmVhZC4gSSBzdGFydGVkIGEgZGlmZmVyZW50IHRocmVhZCAK
b24gQUJJL3NpZ2NvbnRleHQgYXNwZWN0cywgbGV0cyBkaXNjdXNzIGl0IHRoZXJlLgoKPgo+IEkg
ZG9uJ3Qgc2VlIGEgd2F5IHRvIGhhbmRsZSB0aGF0IHdpdGgganVzdCBIV0NBUCwgYXMgd2UgZXNz
ZW50aWFsbHkgCj4gbmVlZCBzb21lIGJpLWRpcmVjdGlvbmFsIGNvbW11bmljYXRvbiBiZXR3ZWVu
IHVzZXJzcGFjZSBhbmQgdGhlIGtlcm5lbCAKPiBzbyB0aGV5IGNhbiBib3RoIGRlY2lkZSB0byB0
dXJuIG9uIFYuwqAgSSBkb24ndCB0aGluayB3ZSBzdHJpY3RseSBuZWVkIAo+IGEgc3lzdGVtIGNh
bGwgdG8gZG8gdGhhdCwgd2Uga2lja2VkIGFyb3VuZCB0aGUgaWRlYSBvZiBlbmNvZGluZyB0aGlz
IAo+IGluIHRoZSBFTEYsIGJ1dCB0aGVyZSdzIGEgbG90IG9mIGZsYXZvcnMgb2YgdmVjdG9yIGlu
IFJJU0MtViBhbmQgd2UndmUgCj4gaGFkIHRyb3VibGUgdHJ5aW5nIHRvIGVuY29kZSB0aGVzZSBp
biBiaW5hcmllcyBiZWZvcmUgc28gaXQgc2VlbXMgCj4gZWFzaWVyIHRvIGp1c3QgdXNlIHRoZSBz
eXNjYWxsLgo+Cj4+IEJ1dCB0aGlzIGZhaWx1cmUgY2FuIGJlIHJlcG9ydGVkIGFzIHBhcnQgb2Yg
ZXhlY3ZlIGFuZCBjbG9uZS4KPj4KPj4+IEl0IGFsc28gcHJvdmlkZXMgdGhlIG9wcG9ydHVuaXR5
IGZvciB0aGUga2VybmVsIHRvIGRlbnkgYWNjZXNzIHRvIHRoZQo+Pj4gdmVjdG9yIGV4dGVuc2lv
biwgcGVyaGFwcyBkdWUgdG8gYWRtaW5pc3RyYXRpdmUgcG9saWN5IG9yIG90aGVyIGZ1dHVyZQo+
Pj4gbWVjaGFuaXNtLgo+Pgo+PiBIV0NBUCBjYW4gZG8gdGhpcywgdG9vLgoKSGF2aW5nIHRoZSBw
cmN0bCBhcyBnZW5lcmFsIHB1cnBvc2Uga25vYiB0byBkaXNhYmxlIHRoZSBWIHVuaXQgZm9yIAp2
YXJpb3VzIHJlYXNvbnMgbWFrZXMgc2Vuc2UuCgpCdXQga2VlcGluZyB0aGUgViB1bml0IGRpc2Fi
bGVkIGJ5IGRlZmF1bHQgYW5kIHVzaW5nIHByY3RsIGFzIGEgCmdhdGVrZWVwZXIgdG8gZW5hYmxl
IGl0IGZlZWxzIHVubmVjZXNzYXJ5IGFuZCB0ZWRpb3VzLgpIZXJlJ3MgbXkgcmVhc29uaW5nIGJl
bG93IChJJ20gY29sbGF0aW5nIGNvbW1lbnRzIGZyb20gcHJpb3IgbXNncyBhcyB3ZWxsKS4KCjEu
IERvZXNuJ3QgaXQgYWRkIGFub3RoZXIgdXNlcnNwYWNlIEFCSSB3aGljaCBpcyBhbHJlYWR5IGEg
aGVhZGFjaGUgZm9yIAp0aGlzIGZlYXR1cmUuIEFuZCB0aGF0IG5lZWRzIHRvIGJlIGJ1aWx0IGlu
dG8gbm90IGp1c3QgbGliYyBidXQgCnBvdGVudGlhbGx5IG90aGVyIHJ1bnRpbWVzIHRvby4gRXZl
biBhZnRlciBpbXBsZW1lbnRpb24gdGhlcmUgd2lsbCBiZSBhbiAKaW50ZXJpbSBwYWluIGFzIHRo
ZSBuZXcgcHJjdGwgdGFrZXMgdGltZSB0byB0cmlja2xlIGRvd24gaW50byB0b29saW5nIAphbmQg
aGVhZGVycy4gQmVzaWRlcyB0aGUgbmV3IHN0dWZmIHdpbGwgbmV2ZXIgYmUgY29tcGF0aWJsZSB3
aXRoIG9sZGVyIAprZXJuZWwgYnV0IHRoYXQgaXMgYSBtaW5vciBwb2ludCBzaW5jZSBvbGRlciBr
ZXJuZWwgbm90IHN1cHBvcnRpbmcgViBpcyAKYSBkZWFsIGJyZWFrZXIgYW55d2F5cy4KCjIuIFBl
b3BsZSB3YW50IHRoZSBwcmN0bCBnYXRla2VlcGluZyBmb3IgYWJpbGl0eSB0byBncmFjZWZ1bGx5
IGhhbmRsZSAKbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSBmb3IgdGhlIGV4dHJhIFYtc3RhdGUg
d2l0aGluIGtlcm5lbC4gQnV0IHRoYXQgCmlzIG9ubHkgYWRkaXRpb25hbCA0SyAoZm9yIHR5cGlj
YWwgMTI4IHdpZGUgViByZWdzKSBwZXIgdGFzay4gSWYgdGhhdCBpcyAKZmFpbGluZywgdGhlIHN5
c3RlbSBpcyBub3QgZG9pbmcgd2VsbCBhbnl3YXlzLiBCZXNpZGVzIGl0IGlzIG5vdCBhbiAKaXNz
dWUgYXQgYWxsIHNpbmNlIEVOT01FTSBpbiBjbG9uZS9leGVjdmUgZm9yIHRoZSBhZGRpdGlvbmFs
IHNwYWNlIApzaG91bGQgaGFuZGxlIHRoZSBmYWlsdXJlIGFueXdheXMuIE9ubHkgdmVyeSBzb3Bo
aXN0aWNhdGVkIGFwcHMgd291bGQgCmRvd25ncmFkZSBmcm9tIGV4ZWN1dGluZyBWIHRvIFNjYWxh
ciBjb2RlIGlmIHRoZSBwcmN0bCBmYWlsZWQuIEluc3RlYWQgCm1lbW9yeSBhbGxvY2F0aW9uIGlz
IG1vcmUgbGlrZWx5IHRvIGJlIGFuIGlzc3VlIHdoZW4gY29weWluZyBWIHN0YXRlIG9uIAphIGRl
ZXAgdXNlciBzdGFjayBhY3Jvc3Mgc2lnbmFsIGhhbmRsaW5nIGJ1dCB0aGVyZSdzIG5vdGhpbmcg
d2UgY2FuIGRvIAphYm91dCBpdC4KCjMuIEFub3RoZXIgYXJndW1lbnQgdG8gcHJjdGwgZ2F0ZWtl
ZXBpbmcgaXMgZW5zdXJpbmcgdXNlci1zcGFjZSBjb25mb3JtcyAKdG8gdmVjdG9yIGxlbmd0aC4g
QnV0IGlzbid0IHRoZSBob2x5IGdyYWlsIG9mIFJWIFYtZXh0ZW5zaW9uIFZMQSAoVmVjdG9yIApM
ZW5ndGggQWdub3N0aWMpIHByb2dyYW1taW5nLiBJIGV4cGVjdCBtb3N0IGltcGxlbWVudHMgdG8g
Zm9sbG93IHRoYXQuIApJZiB0aGVyZSBhcmUgc3VwZXIgc29waGlzdGljYXRlZCAob3IgZHVtYikg
YXBwcyB0aGF0IGRvbid0IGZvbGxvdywgdGhleSAKd2lsbCBmYWlsIHJhbmRvbWx5LiBJIHRoaW5r
IG9mIFZlY3RvciBMZW5ndGggYXMgYW55IG90aGVyIElTQSBleHRlbnNpb25zIAotIGl0cyBub3Qg
dGhhdCBjdXJyZW50bHkgYXBwcyBhcmUgcmVxdWlyZWQgdG8gcHJjdGwoKSBmb3IgYml0bWFuaXAg
CmV4dGVuc2lvbiBpZiB0aGV5IHdhbnQgdG8gdXNlIGl0LiBTdXJlIHRoZXkgY291bGQgdXNlIEFU
X0hXQ0FQIChvciAKL3Byb2MvY3B1aW5mbyBvciBhbnkgb3RoZXIgcG9ydGFibGUgd2F5KSB0byBx
dWVyeSB0aGUgY2FwYWJpbGl0eSwgc2FtZSAKY2FuIGJlIGRvbmUgZm9yIFYgYXMgd2VsbC4gQmVz
aWRlcyB2bGVuIGlzIHJlYWRhYmxlIGZyb20gdXNlciBzcGFjZSBzbyAKdGhlIGFwcCBjYW4gcmVh
ZCBpdCB0byBtYWtlIHN1cmUuIE15IHdvcnJ5IGlzIHdlIGFyZSBwcm92aWRpbmcgCmFkZGl0aW9u
YWwgc2FmZXR5IG5ldCB0byBhIHNtYWxsIGNhdGVnb3J5IG9mIGFwcHMgYXQgdGhlIGV4cGVuc2Ug
b2YgCm1ha2luZyBpdCB0aXJlc29tZSBmb3IgZXZlcnlvbmUgZWxzZS4KCkhXQ0FQIHNvbHZlcyB0
aGUga2VybmVsIHRvIHVzZXItc3BhY2UgY29tbXVuaWNhdGlvbiBvZiBjYXBhYmlsaXRpZXMuIFRo
ZSAKcHJjdGwgaXMgZm9yIHVzZXItc3BhY2UgdG8ga2VybmVsIGNvbW11bmljYXRpb24gYnV0IEkn
bSBub3QgY29udmluY2VkIGl0IAppcyByZWFsbHkgc29sdmluZyBwcm9ibGVtcyBmb3IgdGhlIGNv
bW1vbiBjYXNlLgoKVGh4LAotVmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
