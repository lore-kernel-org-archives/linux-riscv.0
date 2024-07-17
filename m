Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B862C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXs3WI/5oI30nSsMchi5LWhJk6wCkSd7F/YgtV+l/hU=; b=yJnG7cADDz1xQ1
	DgwDWtKGrJjmihQ5/1RbhMugZynrb+Kh35O/Ov6NI7mUI/fFMOfGwY523R1xuv2S7o6BO29SGj4A3
	5Sb1MpkiOPFzspZrIE4YmFCeMoe73Jyr3JWQT1gayXLipO9JjJG1Ik9atbRD6/x5P0WZmSEBK+06+
	0LSbImNPOt/lgbkeIu/e5GLnClH3Pk4+XudidWueqQBVE0e24e1cIDUS0ZtvD/LeBfhTnTgRKYwxA
	meV/zyMzJpBDrMwybo1JVNl1nfnhxsFGuMqexietn+t+eR4OO5G/Uy8lzNXCmF3FkckdAc/7wJLVH
	FTPeqm8kjOeyvzCBpQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU50O-0000000Dwrn-2EBD;
	Wed, 17 Jul 2024 13:47:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU50L-0000000Dwr3-00RB
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:47:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70b002ffc78so336612b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721224055; x=1721828855; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBpW59picKN4VaRpDNbT71+2koRZ3tbahdtbsssxVqY=;
        b=QjYIrGzz4L4EbQBmJH0/9ooEV59I3dv97wMV1T52OVuv6l4krSYlQDYgQkFvO1k17G
         Q29oFTwn72J4VRfNoL5wQqwOOO1f/cGicsXgpS7TwZyEvsgW8gCr+y5G02zqyo3oJU4B
         gU3BgRDpCmuYwMhG8l8ZunKrlNv6HQ7ip6b4neT92a8sqb7BUtfPIi1UJb8B2jZhRQDi
         jHqimA88d4sP8vMkMGtqKncp507hcnQavc8NBtKLBuhsanP65+SUk+ckqgDmYCvc25GQ
         S4kwI0Hh2rNVS+eAMtbBj96XGH56X1GmP55s3QiV2Wizlqfdhw9PG6Ey1c0GX9nNSS5Y
         HR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721224055; x=1721828855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBpW59picKN4VaRpDNbT71+2koRZ3tbahdtbsssxVqY=;
        b=u4gwrzAs3j60xbsbCTITowYdoW03oFcSK6gM/hDetymCHkpBKwVKI/kc16PVwjRRBh
         itVYuSriXEH+LIpvxKlTmQKt2g2J8CyQuYANtQCjH0nceBQR3TUj3+LFst/Uxj446qq9
         UzsQscW3EVJAcjNY8CRKiZNFhjfN+BBkh5bCfdTw2daY5wLhEGUt2rTrYruJ20VBj5ti
         EW4FNLqjA7RiAXMnNC7mt5ubqOOmyH7T/yxkny3eGkYvTpy4c6mbEUx0XIti4kCh67TD
         pJyN1uyCuMdJWYaAZiFqPkc4xYnsgYgN+u4ljn1cEIbr/VtdenEqbyd9R3YAO1Trkbdq
         wYYQ==
X-Gm-Message-State: AOJu0Yx48MXytY2zlmk4g2WD7aqwwOX+Gx2I2PtoPdvPlOioAs3evC/0
	Njn++BGRS/L+chWevyySF+lQ//fzZMmfbqPvQ+q48gH5N4NpBm4hcD5TsZ2HPDU=
X-Google-Smtp-Source: AGHT+IHxw4bA3LWgtRU+YCa2X8Fc71AQA7LAYI4IkNfRbYCBvMwnBVW5kGHw/SElv4tOqos0SFFZEw==
X-Received: by 2002:a05:6a00:2d9b:b0:70b:705f:43ba with SMTP id d2e1a72fcca58-70ce50316c6mr1087853b3a.4.1721224055153;
        Wed, 17 Jul 2024 06:47:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca7865sm8104592b3a.158.2024.07.17.06.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 06:47:34 -0700 (PDT)
Message-ID: <5b974edc-0029-48a1-b181-6beef36869e1@rivosinc.com>
Date: Wed, 17 Jul 2024 15:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: hwprobe: sort EXT_KEY()s in hwprobe_isa_ext0()
 alphabetically
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
References: <20240717-dedicate-squeamish-7e4ab54df58f@spud>
 <cba0c880-a1b2-4bb8-bef0-d280d87ec308@rivosinc.com>
 <20240717-unluckily-collide-1aa35c97662c@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240717-unluckily-collide-1aa35c97662c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_064737_356115_3ACC99EC 
X-CRM114-Status: GOOD (  13.20  )
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

CgpPbiAxNy8wNy8yMDI0IDE1OjQyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MTcsIDIwMjQgYXQgMDM6MzQ6MDZQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBP
biAxNy8wNy8yMDI0IDEwOjU0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBGcm9tOiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4KPj4+IEN1cnJlbnRseSB0aGUg
ZW50cmllcyBhcHBlYXIgdG8gYmUgaW4gYSByYW5kb20gb3JkZXIgKGFsdGhvdWdoIGFjY29yZGlu
Zwo+Pj4gdG8gUGFsbWVyIGhlIGhhcyB0cmllZCB0byBzb3J0IHRoZW0gYnkga2V5IHZhbHVlKSB3
aGljaCBtYWtlcyBpdCBoYXJkZXIKPj4+IHRvIGZpbmQgZW50cmllcyBpbiBhIGdyb3dpbmcgbGlz
dCwgYW5kIG1vcmUgbGlrZWx5IHRvIGhhdmUgY29uZmxpY3RzIGFzCj4+PiBhbGwgcGF0Y2hlcyBh
cmUgYWRkaW5nIHRvIHRoZSBlbmQgb2YgdGhlIGxpc3QuIFNvcnQgdGhlbSBhbHBoYWJldGljYWxs
eQo+Pj4gaW5zdGVhZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4gIAkJaWYgKGhhc19mcHUoKSkgewo+Pj4gLQkJCUVY
VF9LRVkoWkZIKTsKPj4+IC0JCQlFWFRfS0VZKFpGSE1JTik7Cj4+PiAtCQkJRVhUX0tFWShaRkEp
Owo+Pj4gIAkJCUVYVF9LRVkoWkNEKTsKPj4+ICAJCQlFWFRfS0VZKFpDRik7Cj4+PiArCQkJRVhU
X0tFWShaRkEpOwo+Pj4gKwkJCUVYVF9LRVkoWkZIKTsKPj4+ICsJCQlFWFRfS0VZKFpGSE1JTik7
Cj4+PiAgCQl9Cj4+PiAgI3VuZGVmIEVYVF9LRVkKPj4+ICAJfQo+Pgo+PiBJJ2QgcHJlZmVyIHRo
YXQgdG8gYmUgZG9uZSBhZnRlciByZW1vdmluZyB0aGUgImlmCj4+IChoYXNfdmVjdG9yKCkvaGFz
X2ZwdSgpKSBieSB1c2luZyB0aGUgLnZhbGlkYXRlIGNhbGxiYWNrIGZvciBJU0EKPj4gZXh0ZW5z
aW9uLiBUaGlzIHdheSwgeW91J2xsIGhhdmUgb25seSBhIHNpbmdsZSBjb21taXQgcmVvcmRlcmlu
ZyBldmVyeXRoaW5nLgo+IAo+IFJpZ2h0LCBhbmQgSSBkbyBoYXZlIHNvbWUgV0lQIGZvciB0aGF0
IGhlcmUKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9j
b25vci9saW51eC5naXQvbG9nLz9oPXZhbGlkYXRlX2ZwdV9hbmRfdmVjdG9yCj4gYnV0IHdvbid0
IGJlIHNlbmRpbmcgdGhhdCB1bnRpbCBpdCdzIGNsZWFuZWQgdXAgYWZ0ZXIgdGhlIG1lcmdlIHdp
bmRvdy4KPiBJIHdhcyBpbnRlbnRpb25hbGx5IHNlbmRpbmcgdGhpcyBkdXJpbmcgaXQgc28gdGhh
dCB0aGVyZSB3b3VsZCBiZSBubwo+IG1vdmluZyBwaWVjZXMgZm9yIHRoaXMgdG8gY29uZmxpY3Qg
d2l0aCAtIGJlY2F1c2UgaXQgd2lsbCBjb25mbGljdCB3aXRoCj4gYW55IG90aGVyIHBhdGNoIGFk
ZGluZyB0aGluZ3MgdG8gdGhlIGxpc3QgdGFpbHMuCgpNYWtlcyBzZW5zZS4gSWYgeW91IHRoaW5r
IGl0J3Mgd29ydGggaXQ6CgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
