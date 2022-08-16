Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6111BC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyjOOAu1QaHROaWnm4ZjTIXhnKD4UswUBN8BifEzmgQ=; b=ZwDVxdKN6IDzyC
	rZ4sb5rdX5SzK46dOaZUQzksvhjwYSCCqBUg7uQjGyQ12iy0YZph1o/DND+AmqTg/xda9v7ooyRBv
	716IbotzLqnP6L8uUFZxOw629CyW2asvKx8qD0sr+sJHpfBVxePfB4KoLU0NTdSTq+UZZpm9fmpof
	w+4y/BJ/iABcGcN362vxXiPqkN9FBmWzE655A4VBagrT2kwmVAjxXAe19ZJ26BALVVvn3XJn5CBwN
	GJlV12qtzVi7CzZ4GDBijRX9avqB0eDv5VS6rNFvEovVng6U8Gdw2XAvGlUMPdjLTMnGpyiOY8D5q
	zto5DY+tfAJyBdqGbz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuTo-001QlO-E3; Tue, 16 Aug 2022 11:11:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuTk-001Qi4-V9
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 11:11:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id a9so14414183lfm.12
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0cuU1bG6KFLMr6an740FWMa8MPaqg8PFLx685pJUkOY=;
        b=GYEkY3kBMOdN21wTqQAEDOg88pgX6jp9BtCRiEAUPFEC6zLl70PjISb/WBZMzz3c/E
         azAJ/UWONLB1jmDNlv9VZH2FA77IyeUK8jMU51+I/lXnmBeUB6KNCTR94t1sG0NrS9vt
         UnWaYBYdbffWDhISjUJXAUDWBwzwYGfsDdS/xntKp6At257goXRAUH5oiRfXMgJg5aFQ
         6tS7afCAa6zoTnvIK4rB3RePeJNCayOSIY6uaJ0DqtXTt5vVGG0GC7gO5ngutEGaZMca
         6W5ZMF8oiVXgcqcq9d4QDxrta+c6D//Ffad0mHN5wG4u8vy2kG54TuUk19KN2RewMM6+
         CzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0cuU1bG6KFLMr6an740FWMa8MPaqg8PFLx685pJUkOY=;
        b=Y9epGAl1oRo4e6QzgXxCXUVd2jRFwUjiH2e/RVr7n1UIIR6E2ZeprTsqVEcDXyjL8i
         P3IpTdJRSaSjcD2P2eI5eKD8cH1TsKNB6L+xpKBhf13VTULrQA/Uhm/0XEt56RIlsQEi
         C8FBciQ4LTMy53RjNF1yP0CypIfVQ4BpMaX0iAt8DCnO7qDplQLAIS2Fs7OJ6aJgQx8k
         53L9+igMrO7KjtbAVvuuVpQaTxXSOqXdoHmrd0HIHRdiSloi/29pdWrRAxJyesLS27C+
         I3KH7KZ9Zn2s3Ooqkk7/pH5PSVlJ03//L6Xce8VMEkSDkjsq3qjfExiin4/0eupLSnVF
         p9XQ==
X-Gm-Message-State: ACgBeo1PwYGzgNodQPhocNi6I7rYJSJGC9KiEoyaegYjqtGVRDzat0ab
	aPHNsg0QHUnbo9WQ9MVRuDN07Q==
X-Google-Smtp-Source: AA6agR4jvAh3L22ickhZa14uDRFbhGMs9hDFABhJBvwWXmWM/n4NtsL5IflGqzOc8MYp3IFiSXYs5A==
X-Received: by 2002:ac2:47f1:0:b0:48a:ea6e:b8fd with SMTP id b17-20020ac247f1000000b0048aea6eb8fdmr6589451lfp.26.1660648282335;
        Tue, 16 Aug 2022 04:11:22 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id u17-20020a056512041100b0047f7419de4asm1354065lfk.180.2022.08.16.04.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 04:11:21 -0700 (PDT)
Message-ID: <29072f12-b9a3-9815-ad52-5c4f6b1634b3@linaro.org>
Date: Tue, 16 Aug 2022 14:11:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <5593349.DvuYhMxLoT@jernej-laptop> <3881930.ZaRXLXkqSa@diego>
 <2249129.ElGaqSPkdT@jernej-laptop>
 <b5401052-e803-9788-64d6-82b2737533ce@linaro.org>
 <20220816120050.07dc2416@donnerap.cambridge.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220816120050.07dc2416@donnerap.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_041125_060323_0F5056CB 
X-CRM114-Status: GOOD (  22.22  )
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

T24gMTYvMDgvMjAyMiAxNDowMCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gT24gVHVlLCAxNiBB
dWcgMjAyMiAxMjo0MjozOSArMDMwMAo+IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gCj4gSGksCj4gCj4+IE9uIDE2LzA4LzIwMjIg
MTI6MjUsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPj4+IERuZSB0b3JlaywgMTYuIGF2Z3VzdCAy
MDIyIG9iIDExOjEyOjA1IENFU1QgamUgSGVpa28gU3TDvGJuZXIgbmFwaXNhbChhKTogIAo+Pj4+
IEFtIERpZW5zdGFnLCAxNi4gQXVndXN0IDIwMjIsIDA5OjQ5OjU4IENFU1Qgc2NocmllYiBKZXJu
ZWogxaBrcmFiZWM6ICAKPj4+Pj4gRG5lIHRvcmVrLCAxNi4gYXZndXN0IDIwMjIgb2IgMDk6NDE6
NDUgQ0VTVCBqZSBLcnp5c3p0b2YgS296bG93c2tpICAgCj4+PiBuYXBpc2FsKGEpOiAgCj4+Pj4+
PiBPbiAxNS8wOC8yMDIyIDA4OjA4LCBTYW11ZWwgSG9sbGFuZCB3cm90ZTogIAo+Pj4+Pj4+ICsK
Pj4+Pj4+PiArCWRlOiBkaXNwbGF5LWVuZ2luZSB7Cj4+Pj4+Pj4gKwkJY29tcGF0aWJsZSA9ICJh
bGx3aW5uZXIsc3VuMjBpLWQxLWRpc3BsYXktZW5naW5lIjsKPj4+Pj4+PiArCQlhbGx3aW5uZXIs
cGlwZWxpbmVzID0gPCZtaXhlcjA+LCA8Jm1peGVyMT47Cj4+Pj4+Pj4gKwkJc3RhdHVzID0gImRp
c2FibGVkIjsKPj4+Pj4+PiArCX07Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsJb3NjMjRNOiBvc2MyNE0t
Y2xrIHsgIAo+Pj4+Pj4KPj4+Pj4+IGxvd2VyY2FzZQo+Pj4+Pj4gIAo+Pj4+Pj4+ICsJCWNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOwo+Pj4+Pj4+ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAw
MDAwMD47ICAKPj4+Pj4+Cj4+Pj4+PiBUaGlzIGlzIGEgcHJvcGVydHkgb2YgdGhlIGJvYXJkLCBu
b3QgU29DLiAgCj4+Pj4+Cj4+Pj4+IFNvQyBuZWVkcyAyNCBNSHogb3NjaWxsYXRvciBmb3IgY29y
cmVjdCBvcGVyYXRpb24sIHNvIGVhY2ggYW5kIGV2ZXJ5IGJvYXJkCj4+Pj4+IGhhcyBpdC4gSGF2
aW5nIGl0IGhlcmUgc2ltcGxpZmllcyBib2FyZCBEVCBmaWxlcy4gIAo+Pj4+Cj4+Pj4gSSBndWVz
cyB0aGUgb3NjaWxsYXRvciBpcyBhIHNlcGFyYXRlIGNvbXBvbmVudCBvbiBlYWNoIGJvYXJkLCBy
aWdodD8gIAo+Pj4KPj4+IENvcnJlY3QuCj4+PiAgIAo+Pj4+IEFuZCBEVCBvYnZpb3VzIGlzIG1l
YW50IHRvIGRlc2NyaWJlIHRoZSBoYXJkd2FyZSAtIGluZGVwZW5kZW50bHkgZnJvbQo+Pj4+IGlt
cGxlbWVudGF0aW9uLXNwZWNpZmljIGNob2ljZXMuICAKPj4+Cj4+PiBUaGVyZSBpcyBubyBjaG9p
Y2UgaW4gdGhpcyBjYXNlLiAyNCBNSHogY3J5c3RhbCBoYXMgdG8gYmUgcHJlc2VudC4KPj4+Cj4+
PiBGV0lXLCBpbmNsdWRpbmcgY3J5c3RhbCBub2RlIGluIFNvQyBzcGVjaWZpYyBEVFNJIGlzIGFs
cmVhZHkgY29tbW9uIHBhdHRlcm4gaW4gCj4+PiBBbGx3aW5uZXIgQVJNIFNvQyBEVFNJIGZpbGVz
Lgo+Pj4gICAKPj4+Pgo+Pj4+IFN0YXJ0aW5nIHRvIGRpc2N1c3Mgd2hpY2ggZXhjZXB0aW9ucyB0
byBhbGxvdyB0aGVuIG1pZ2h0IGxlYWQgdG8gZXZlbiBtb3JlCj4+Pj4gZXhjZXB0aW9ucy4KPj4+
Pgo+Pj4+IEFsc28gaGF2aW5nIHRvIGxvb2sgZm9yIGEgYm9hcmQtY29tcG9uZW50IGluIHRoZSBz
b2MgZHRzaSBhbHNvIGlzIHN1cnByaXNpbmcKPj4+PiBpZiBvbmUgZ2V0cyB0byB0aGUgcGFydHkg
bGF0ZXIgb24gOi0pIC4gIAo+Pj4KPj4+IEFzIEkgc2FpZCwgaWYgb25lIGlzIGFjY3VzdG9tZWQg
dG8gQWxsd2lubmVyIEFSTSBEVCBkZXZlbG9wbWVudCwgaXQgd291bGQgYmUgCj4+PiBtb3JlIHN1
cnByaXNpbmcgdG8gaW5jbHVkZSAyNCBNSHogY3J5c3RhbCBub2RlIGluIGVhY2ggYW5kIGV2ZXJ5
IGJvYXJkIERULiAgCj4+Cj4+IEl0J3Mgc2FtZSBldmVyeXdoZXJlLiBBbGx3aW5uZXIsIEV4eW5v
cywgaU1YLCBRdWFsY29tbS4gRXZlcnl3aGVyZSB0aGlzCj4+IGlzIGEgcGFydCBvZiB0aGUgYm9h
cmQsIHNvIGV2ZW4gaWYgb3NjaWxsYXRvciBmcmVxdWVuY3kgaXMgZml4ZWQgKGFzIGluCj4+IDk5
JSBvZiBjYXNlcyBhbHRob3VnaCBzb21lIFNvQ3MgSSB0aGluayBtaWdodCBqdXN0IGFsbG93IHRv
IGltcGxlbWVudAo+PiBvbmUgb2YgZmV3KSwgc3RpbGwgdGhpcyBpcyBhIHByb3BlcnR5IG9mIHRo
ZSBib2FyZC4gQmVjYXVzZToKPj4gMS4gRFRTSSBkZXNjcmliZXMgdGhlIFNvQyBwYXJ0LCBub3Qg
Ym9hcmQuCj4+IDIuIFNvIHRoZSBEVFMgZGV2ZWxvcGVyIGlzIGEgYml0IG1vcmUgY29uc2Npb3Vz
IGFib3V0IGhpcyBkZXNpZ24uCj4gCj4gMSkgaXMgY2VydGFpbmx5IHRydWUsIGJ1dCBpbmRlZWQg
bW9zdCBwbGF0Zm9ybXMgcHV0IHRoZSBiYXNlCj4gY3J5c3RhbCBvc2NpbGxhdG9yIGluIHRoZSBT
b0MgLmR0c2k6CgpZZXMuIEFuZCBvbmNlIHBlciB3ZWVrIHdoZW4gSSBsb29rIGF0IG5ldyBEVFMg
SSBuZWVkIHRvIHJlcGVhdCB0aGUgc2FtZQphcmd1bWVudHMuIDopCgo+IEkganVzdCBzYW1wbGVk
IFJvY2tjaGlwIChyazMzOTkuZHRzaSwKPiByazM1NnguZHRzaSwgcmszMzI4LmR0c2kpLCBBbWxv
Z2ljIChtZXNvbi1nMTItY29tbW9uLmR0c2kpLCBBY3Rpb25TZW1pIChzWzc5XTAwLmR0c2kpLAo+
IFF1YWxjb21tIChtc204OTE2LmR0c2ksIHNtODQ1MC5kdHNpLCBzYzcxODAuZHRzaSksIEZyZWVz
Y2FsZSAoaW14OG1tLmR0c2ksCj4gaW14OHF4cC5kdHNpKSwgUmVhbHRlayAocnRkMTI5eC5kdHNp
KSwgQnJvYWRjb20gKGJjbTI4M3guZHRzaSksIE1lZGlhdGVrCj4gKG10ODE4My5kdHNpLCBtdDg1
MTYuZHRzaSkuIFRoZSBsaXN0IHByb2JhYmx5IGdvZXMgb24gKEkganVzdCBzdG9wcGVkCj4gaGVy
ZSkuCj4gCj4gSSB0aGluayBvbmUgcmVhc29uIG1pZ2h0IGJlIHRoYXQgdGhpcyBpcyBzbyBjZW50
cmFsIHRvIHRoZSB3aG9sZSBTb0MKPiBvcGVyYXRpb24sIHRoYXQgaXQncyBhbHJlYWR5IHJlZmVy
ZW5jZWQgbXVsdGlwbGUgdGltZXMgaW4gdGhlIGJhc2UgLmR0c2kuCj4gQW5kIGhhdmluZyBhIHll
dCB1bnJlc29sdmVkIHJlZmVyZW5jZSBpbiB0aGUgLmR0c2kgbG9va3MgZG9kZ3kuCj4gCj4gTlZp
ZGlhIHNlZW1zIHRvIG9taXQgYSBiYXNlIG9zY2lsbGF0b3IgKG1heWJlIGl0J3MgaW1wbGljaXQg
aW4gdGhlaXIKPiBiaW5kaW5nIGRlc2lnbiksIE1hcnZlbGwgZG9lc24ndCB1c2UgYSBmaXhlZC1j
bG9jayAoYnV0IHN0aWxsIHB1dHMgdGhlaXIKPiBiYXNlIGNsb2NrIGluIGFybWFkYS0zN3h4LmR0
c2kpLgo+IAo+IEV4eW5vcyBhbmQgUmVuZXNhcyBwdXQgYSAqc3R1YiogZml4ZWQtY2xvY2sgaW4g
dGhlIC5kdHNpLCBhbmQgc2V0IHRoZQo+IGZyZXF1ZW5jeSBpbiB0aGUgYm9hcmQgLmR0cyBmaWxl
cy4gV291bGQgdGhpcyBiZSBhIGNvbXByb21pc2U/CgpUaGlzIGlzIGV4YWN0bHkgd2hhdCBJIHNh
aWQgYmVmb3JlLiBUaGUgY2xvY2sgZnJlcXVlbmN5IGlzIGEgcHJvcGVydHkgb2YKdGhlIGJvYXJk
LiBGZWVsIGZyZWUgdG8ga2VlcCB0aGUgcmVzdCBvZiB0aGUgY2xvY2sgaW4gdGhlIFNvQyBEVFNJ
IHRvCnJlZHVjZSBkdXBsaWNhdGlvbiwgYnV0IGF0IG1pbmltdW0gdGhlIGNsb2NrIHNob3VsZCBn
byB0byB0aGUgYm9hcmQuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
