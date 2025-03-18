Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3C7C28B28
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIEG9t8nz6QHapEXLg84ldWhrwzErJVbkuruNdY9YjM=; b=Vb7NTBhQ9oXTRE
	Ds/mIPTcBAZ6sW7bRer/ycOEE0Oqi0lDdl+dnGqnwXnUd2KXdb8VSqutz1ATwKGRcQROFQuehHxrI
	H8sOdoYiN+AYJ7sxa3kyHq14X5PI9Sz5hSYBPoCM8KFz/jSFVO2XuMF0Pwjw9+XVhbFDZhzAOANpx
	mKE9T70RyW+2VE7LzHbd97WlAflgGUPdk+y6aaVKMYEZEZ0b4oj5890P2SZjnZuozJBUSU+z3CYWd
	9KkeMe3wA00/FV2ddWjJZpYrkYJ2ge9RqwAeXfXi+gF19UwB97Ddc5+mtt3DYcu2WkspOmOlJ80KO
	Ou960sRxJFvqD0I1FVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXtp-00000006BDV-1Ziq;
	Tue, 18 Mar 2025 14:26:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXpp-00000006AOO-1bls
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 14:22:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22435603572so91758495ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742307744; x=1742912544; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGpINx731Tmb96Qe0VWFaWPTECmsS+PdS8emXnbhmLs=;
        b=3GpE9l0nBovSqD20QHvN4xuiFQRZqQASojn9dmH/siPfu8LVhrvEoPnyX8Mx48CF9H
         9tbme5KAvZEaRm7NY4xAoeoNc+zX4LHBAT9yFMnhZxhMvRAjd55RvTMx8zTu5mB6P2Us
         ZwOULtSqw39SNvKh1ZTilk0B0fm4sDcnCgu2OVlYr+uw7pyTOMbxweHPDGUqPsF+/Mbq
         t4opsp2fXE6Ug2wP6Wo8uegjhGNj9cXW+ZVf9xmAqP9WEU6oPpI5y9vxkP00yU9dYlxo
         MC0oaE44RhYlzzHkwnaQNyBzxZjiib2H6yaLSRFIK6cHv3ag307JrH2l0KzrrlyqtbEO
         qx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742307744; x=1742912544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGpINx731Tmb96Qe0VWFaWPTECmsS+PdS8emXnbhmLs=;
        b=ftZS1wc8uGjJG1G4VrhgMiRMybZcw91ZQKN/GwrIJV7s5iiFHJzRc2HP6oHW6Np8wo
         p4PnQJIUXFlXxTvJZtd3Od1Pwo3ztgjMtuFtzCM4f6/YTQVBQQNsJKdv0gij1E+qfIY7
         TnOmvIcM16XjnEq8FBFTrbPoP4NVpmXKIcELr1rQ2KD0Xh0bP815Xdhpt7HL/kflgk54
         F2l2IN25RkTqDg4lCfpFJXtRALmnNhxXpwD6bvQ3h3w+pD5+ZBNUqPKmkHQk7gE/GpZA
         HCwehV6V0WCqnx7tpEHZzJe889GJN5ex/7PVmQzs83U3ApysTIKvp4TN/TJTedM3jJtz
         PZiA==
X-Gm-Message-State: AOJu0YzY4L9RQ/T7iLvRqrhiJVfrcGHeHgsm9l3EVV8XN/r/nmqYUXxw
	dfLhySxBL96w6qk0EqnvGw/EbFqM9HLMleCHrrY9h8u+JSpWZkZzKpeRc5hE2RQPerhUA+NZlqO
	Pbbg=
X-Gm-Gg: ASbGncu8JoztrOPUnOu0aXMVQ4IlrkGp6H1BiyxLmgOfTVZOOwh2hVd5kBMB6LVnBIb
	9AuBeMoqJ31CQQVBkSFaZue1VJJPSNrZFcbdEmCw5ZuZHs8MWiI0bRQ80BvHgpQSUPiLfNufPrU
	e20N8URghUdFHkSOtPmtEYvFh5Q/k1nBYbAFbVg5/kmvTGrWjtNRAgoKW2nYF6T9ndvihue6FNN
	k950Bd0NGsYRS3uIk+aUOtFzv+8ZqQ8XQbffz9AYL+00BV+PjE+mxkjDofdhJfoQHp3axt3YVoy
	EpnvSED2+ikfwQ1liasdaNHiSlDWw+1cTA1mivL84kLgIDRUrUScuP85CSRSyh8fpa81+THfUPw
	TvNj5mxkfiVy7LA==
X-Google-Smtp-Source: AGHT+IFEi0TRz0hE3pZlW2uv3/pl5phfAMhd9vaZ7+UlbHxqBQC4Z8iGvu+5+IushiykE4M6pVxcYQ==
X-Received: by 2002:a17:903:40c7:b0:224:191d:8a87 with SMTP id d9443c01a7336-225e0a82f1cmr208441955ad.26.1742307744477;
        Tue, 18 Mar 2025 07:22:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a7f5fsm94698925ad.80.2025.03.18.07.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:22:23 -0700 (PDT)
Message-ID: <05bdf6c3-9d60-4b1c-add3-79b4f7d25189@rivosinc.com>
Date: Tue, 18 Mar 2025 15:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
To: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 charlie@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
 <20250318-18b96818299ef211ef8ca620@orel>
 <d7a04d06-766b-4b43-8c42-2b681629c35d@ghiti.fr>
 <20250318-ec2a990d55378039a863b94b@orel>
 <44304bca-b30a-4c0b-b242-3a54ac021e40@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <44304bca-b30a-4c0b-b242-3a54ac021e40@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_072225_436975_A16D17CD 
X-CRM114-Status: GOOD (  36.83  )
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

CgpPbiAxOC8wMy8yMDI1IDE1OjA5LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gT24gMTgvMDMv
MjAyNSAxNDowNCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+PiBPbiBUdWUsIE1hciAxOCwgMjAyNSBh
dCAwMTo1ODoxMFBNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+PiBPbiAxOC8wMy8y
MDI1IDEzOjQ1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+Pj4gT24gVHVlLCBNYXIgMTgsIDIwMjUg
YXQgMDE6MTM6MThQTSArMDEwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+Pj4+PiBPbiAxOC8w
My8yMDI1IDA5OjQ4LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIE1hciAxNywg
MjAyNSBhdCAwMzozOTowMVBNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+Pj4+Pj4g
SGkgRHJldywKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIDA0LzAzLzIwMjUgMTM6MDAsIEFuZHJldyBKb25l
cyB3cm90ZToKPj4+Pj4+Pj4gQWxsb3cgc2tpcHBpbmcgc2NhbGFyIGFuZCB2ZWN0b3IgdW5hbGln
bmVkIGFjY2VzcyBzcGVlZCB0ZXN0cy4gVGhpcwo+Pj4+Pj4+PiBpcyB1c2VmdWwgZm9yIHRlc3Rp
bmcgYWx0ZXJuYXRpdmUgY29kZSBwYXRocyBhbmQgdG8gc2tpcCB0aGUKPj4+Pj4+Pj4gdGVzdHMg
aW4KPj4+Pj4+Pj4gZW52aXJvbm1lbnRzIHdoZXJlIHRoZXkgcnVuIHRvbyBzbG93bHkuIEFsbCBD
UFVzIG11c3QgaGF2ZSB0aGUgc2FtZQo+Pj4+Pj4+PiB1bmFsaWduZWQgYWNjZXNzIHNwZWVkLgo+
Pj4+Pj4+IEknbSBub3QgYSBiaWcgZmFuIG9mIHRoZSBjb21tYW5kIGxpbmUgcGFyYW1ldGVyLCB0
aGlzIGlzIG5vdAo+Pj4+Pj4+IHdoZXJlIHdlIHNob3VsZAo+Pj4+Pj4+IHB1c2ggdWFyY2ggZGVj
aXNpb25zIGJlY2F1c2UgdGhlcmUgY291bGQgYmUgbWFueSBvdGhlciBpbiB0aGUKPj4+Pj4+PiBm
dXR1cmUsIHRoZQo+Pj4+Pj4+IGJlc3Qgc29sdXRpb24gdG8gbWUgc2hvdWxkIGJlIGluIERUL0FD
UEkgYW5kIHNpbmNlIHRoZSBEVCBmb2xrcywKPj4+Pj4+PiBhY2NvcmRpbmcKPj4+Pj4+PiB0byBQ
YWxtZXIsIHNodXQgZG93biB0aGlzIHNvbHV0aW9uLCBpdCByZW1haW5zIHVzaW5nIGFuIGV4dGVu
c2lvbi4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgaGF2ZSBiZWVuIHJlYWRpbmcgYSBiaXQgYWJvdXQgdW5h
bGlnbmVkIGFjY2Vzc2VzLiBaaWNjbHNtIHdhcwo+Pj4+Pj4+IGRlc2NyaWJlZCBhcwo+Pj4+Pj4+
ICJFdmVuIHRob3VnaCBtYW5kYXRlZCwgbWlzYWxpZ25lZCBsb2FkcyBhbmQgc3RvcmVzIG1pZ2h0
IGV4ZWN1dGUKPj4+Pj4+PiBleHRyZW1lbHkKPj4+Pj4+PiBzbG93bHkuIFN0YW5kYXJkIHNvZnR3
YXJlIGRpc3RyaWJ1dGlvbnMgc2hvdWxkIGFzc3VtZSB0aGVpcgo+Pj4+Pj4+IGV4aXN0ZW5jZSBv
bmx5Cj4+Pj4+Pj4gZm9yIGNvcnJlY3RuZXNzLCBub3QgZm9yIHBlcmZvcm1hbmNlLiIgaW4gcnZh
MjAvMjIgYnV0ICpub3QqIGluCj4+Pj4+Pj4gcnZhMjMuIFNvCj4+Pj4+Pj4gd2hhdCBhYm91dCB1
c2luZyB0aGlzICJob2xlIiBhbmQgY29uc2lkZXIgdGhhdCBhIHBsYXRmb3JtIHRoYXQKPj4+Pj4+
PiAqYWR2ZXJ0aXNlcyoKPj4+Pj4+PiBaaWNjbHNtIG1lYW5zIGl0cyB1bmFsaWduZWQgYWNjZXNz
ZXMgYXJlIGZhc3Q/IEFmdGVyIGludGVybmFsCj4+Pj4+Pj4gZGlzY3Vzc2lvbiwgSXQKPj4+Pj4+
PiBhY3R1YWxseSBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIGFkdmVydGlzZSBaaWNjbHNtIGlmIHRo
ZSBwbGF0Zm9ybQo+Pj4+Pj4+IGFjY2Vzc2VzCj4+Pj4+Pj4gYXJlIHNsb3cgcmlnaHQ/Cj4+Pj4+
PiBUaGlzIHRvcGljIHBvcHMgdXAgZXZlcnkgc28gb2Z0ZW4sIGluY2x1ZGluZyBpbiB5ZXN0ZXJk
YXkncyBzZXJ2ZXIKPj4+Pj4+IHBsYXRmb3JtIFRHIGNhbGwuIEluIHRoYXQgY2FsbCwgYW5kLCBh
ZmFpY3QsIGV2ZXJ5IG90aGVyIHRpbWUgaXQgaGFzCj4+Pj4+PiBwb3BwZWQgdXAsIHRoZSByZXN1
bHQgaXMgdG8gcmVpdGVyYXRlIHRoYXQgSVNBIGV4dGVuc2lvbnMgbmV2ZXIgc2F5Cj4+Pj4+PiBh
bnl0aGluZyBhYm91dCBwZXJmb3JtYW5jZS4gU28sIFppY2Nsc20gd2lsbCBuZXZlciBtZWFuIGZh
c3QgYW5kIHdlCj4+Pj4+PiB3b24ndCBsaWtlbHkgYmUgYWJsZSB0byBhZGQgYW55IGV4dGVuc2lv
biB0aGF0IGRvZXMuCj4+Pj4+IE9rLCBJIHNob3VsZCBub3Qgc2F5ICJmYXN0Ii4gVXN1YWxseSwg
d2hlbiBhbiBleHRlbnNpb24gaXMKPj4+Pj4gYWR2ZXJ0aXNlZCBieSBhCj4+Pj4+IHBsYXRmb3Jt
LCB3ZSBkb24ndCBxdWVzdGlvbiBpdHMgc3BlZWQgKHppY2JveiwgemljYm9tLi4uZXRjKSwgd2UK
Pj4+Pj4gc2ltcGx5IHVzZQo+Pj4+PiBpdCBhbmQgaXQncyB1cCB0byB0aGUgdmVuZG9yIHRvIGJl
bmNobWFyayBpdHMgaW1wbGVtZW50YXRpb24gYW5kIGFjdAo+Pj4+PiBhY2NvcmRpbmdseSAoaS5l
LiBkbyBub3Qgc2V0IGl0IGluIHRoZSBpc2Egc3RyaW5nKS4KPj4+Pj4KPj4+Pj4KPj4+Pj4+PiBh
cm02NCBmb3IgZXhhbXBsZSBjb25zaWRlcnMgdGhhdCBhcm12OCBoYXMgZmFzdCB1bmFsaWduZWQK
Pj4+Pj4+PiBhY2Nlc3NlcyBhbmQgY2FuCj4+Pj4+Pj4gdGhlbiBlbmFibGUgSEFWRV9FRkZJQ0lF
TlRfQUxJR05FRF9BQ0NFU1MgaW4gdGhlIGtlcm5lbCwgZXZlbgo+Pj4+Pj4+IHRob3VnaCBzb21l
Cj4+Pj4+Pj4gdWFyY2hzIGFyZSBzbG93LiBEaXN0cm9zIHdpbGwgdmVyeSBsaWtlbHkgdXNlIHJ2
YTIzIGFzIGJhc2VsaW5lCj4+Pj4+Pj4gc28gdGhleSB3aWxsCj4+Pj4+Pj4gZW5hYmxlIFppY2Ns
c20gd2hpY2ggd291bGQgYWxsb3cgdXMgdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcwo+Pj4+Pj4+
IHRvbywgd2l0aG91dAo+Pj4+Pj4+IHRoaXMsIHdlIGxvc2UgYSBsb3Qgb2YgcGVyZiBpbXByb3Zl
bWVudCBpbiB0aGUga2VybmVsLCBzZWUKPj4+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjMxMjI1MDQ0MjA3LjM4MjEtMS0KPj4+Pj4+PiBqc3poYW5nQGtlcm5lbC5vcmcvLgo+
Pj4+Pj4+Cj4+Pj4+Pj4gT3Igd2UgY291bGQgaGF2ZSBhIG5ldyBuYW1lZCBmZWF0dXJlIGZvciB0
aGlzLCBldmVuIHRob3VnaCBpdCdzCj4+Pj4+Pj4gd2VpcmQgdG8KPj4+Pj4+PiBoYXZlIGEgbmFt
ZWQgZmVhdHVyZSB3aGljaCB3b3VsZCBiYXNpY2FsbHnCoCBtZWFuICJaaWNjbHNtIGlzCj4+Pj4+
Pj4gZmFzdCIuIFdlIGRvbid0Cj4+Pj4+Pj4gaGF2ZSwgZm9yIGV4YW1wbGUsIGEgbmFtZWQgZmVh
dHVyZSB0byBzYXkgIlppY2JveiBpcyBmYXN0IiBidXQKPj4+Pj4+PiBnaXZlbiB0aGUKPj4+Pj4+
PiB2YWd1ZSB3b3JkaW5nIGluIHRoZSBwcm9maWxlIHNwZWMsIG1heWJlIHdlIGNhbiBhc2sgZm9y
IG9uZSBpbgo+Pj4+Pj4+IHRoYXQgY2FzZT8KPj4+Pj4+Pgo+Pj4+Pj4+IFNvcnJ5IGZvciB0aGUg
bGF0ZSByZXZpZXcgYW5kIGZvciB0cmlnZ2VyaW5nIHRoaXMgZGViYXRlLi4uCj4+Pj4+PiBObyBw
cm9ibGVtLCBsZXQncyB0cnkgdG8gcGljayB0aGUgYmVzdCBvcHRpb24uIEknbGwgdHJ5IGxpc3Rp
bmcKPj4+Pj4+IGFsbCB0aGUKPj4+Pj4+IG9wdGlvbnMgYW5kIHRoZXJlIHByb3MvY29ucy4KPj4+
Pj4+Cj4+Pj4+PiAxLiBMZWF2ZSBhcyBpcywgd2hpY2ggaXMgdG8gYWx3YXlzIHByb2JlCj4+Pj4+
PiDCoMKgwqDCoMKgIHBybzogTm90aGluZyB0byBkbwo+Pj4+Pj4gwqDCoMKgwqDCoCBjb246IE5v
dCBpZGVhbCBpbiBhbGwgZW52aXJvbm1lbnRzCj4+Pj4+Pgo+Pj4+Pj4gMi4gTmV3IERUL0FDUEkg
ZGVzY3JpcHRpb24KPj4+Pj4+IMKgwqDCoMKgwqAgcHJvOiBEZXNjcmliaW5nIHdoZXRoZXIgb3Ig
bm90IG1pc2FsaWduZWQgYWNjZXNzZXMgYXJlCj4+Pj4+PiBpbXBsZW1lbnRlZCBpbgo+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgSFcgKHdoaWNoIHByZXN1bWFibHkgbWVhbnMgZmFzdCkgaXMg
c29tZXRoaW5nIHRoYXQKPj4+Pj4+IHNob3VsZCBiZSBkb25lCj4+Pj4+PiDCoMKgwqDCoGluIEhX
IGRlc2NyaXB0aW9ucwo+Pj4+Pj4gwqDCoMKgwqDCoCBjb246IFdlJ2xsIG5lZWQgdG8gbGl2ZSB3
aXRoIHByb2JpbmcgdW50aWwgd2UgY2FuIGdldCB0aGUKPj4+Pj4+IGRlc2NyaXB0aW9ucwo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmaW5lZCwgd2hpY2ggbWF5IGJlIG5ldmVyIGlmIHRo
ZXJlJ3MgdG9vIG11Y2ggb3Bwb3NpdGlvbgo+Pj4+Pj4KPj4+Pj4+IDMuIENvbW1hbmQgbGluZQo+
Pj4+Pj4gwqDCoMKgwqDCoCBwcm86IEVhc3kgYW5kIHNlcnZlcyBpdHMgcHVycG9zZSwgd2hpY2gg
aXMgdG8gc2tpcCBwcm9iaW5nCj4+Pj4+PiBpbiB0aGUKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGVudmlyb25tZW50cyB3aGVyZSBwcm9iaW5nIGlzIG5vdCBkZXNpcmVkCj4+Pj4+PiDCoMKg
wqDCoMKgIGNvbjogWWV0IGFub3RoZXIgY29tbWFuZCBsaW5lIG9wdGlvbiAod2hpY2ggd2UgbWF5
IHdhbnQgdG8KPj4+Pj4+IGRlcHJlY2F0ZQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc29t
ZWRheSkKPj4+Pj4+Cj4+Pj4+PiA0LiBOZXcgSVNBIGV4dGVuc2lvbgo+Pj4+Pj4gwqDCoMKgwqDC
oCBwcm86IEVhc3kgdG8gYWRkIHRvIEhXIGRlc2NyaXB0aW9ucwo+Pj4+Pj4gwqDCoMKgwqDCoCBj
b246IE5vdCBsaWtlbHkgdG8gZ2V0IGl0IHRocm91Z2ggcmF0aWZpY2F0aW9uCj4+Pj4+Pgo+Pj4+
Pj4gNS4gTmV3IFNCSSBGV0ZUIGZlYXR1cmUKPj4+Pj4+IMKgwqDCoMKgwqAgcHJvOiBQcm9iYWJs
eSBlYXNpZXIgdG8gZ2V0IHRocm91Z2ggcmF0aWZpY2F0aW9uIHRoYW4gYW4gSVNBCj4+Pj4+PiBl
eHRlbnNpb24KPj4+Pj4+IMKgwqDCoMKgwqAgY29uOiBJbnN0ZWFkIG9mIHByb2JpbmcsIGtlcm5l
bCB3b3VsZCBoYXZlIHRvIGFzayBTQkkgLS0KPj4+Pj4+IHdvdWxkIHRoYXQKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGV2ZW4gYmUgZmFzdGVyPyBXaWxsIGFsbCB0aGUgZW52aXJvbm1lbnRz
IHRoYXQgd2FudCB0bwo+Pj4+Pj4gc2tpcAo+Pj4+Pj4gwqDCoMKgwqBwcm9iaW5nIGV2ZW4gaGF2
ZSBhIGNvbXBsZXRlIFNCST8KPj4+Pj4+Cj4+Pj4+PiA2LiA/Pwo+Pj4+PiBTbyB3aGF0IGFib3V0
Ogo+Pj4+Pgo+Pj4+PiA3LiBOZXcgZW51bSB2YWx1ZSBkZXNjcmliaW5nIHRoZSBwZXJmb3JtYW5j
ZSBhcyAiRk9SQ0VEIiBvciAiSFciIChvcgo+Pj4+PiBhbnl0aGluZyBiZXR0ZXIpCj4+Pj4+IMKg
IMKgwqDCoCBwcm86IFdlIG9ubHkgdXNlIHRoZSBleGlzdGluZyBaaWNjbHNtCj4+Pj4+IMKgIMKg
wqDCoCBjb246IEl0J3Mgbm90IGNsZWFyIHRoYXQgdGhlIGFjY2Vzc2VzIGFyZSBmYXN0IGJ1dCBp
dAo+Pj4+PiBiYXNpY2FsbHkgc2F5cyB0bwo+Pj4+PiBTVyAiZG9uJ3QgdGhpbmsgdG9vIG11Y2gs
IEknbSB0ZWxsaW5nIHlvdSB0aGF0IHlvdSBjYW4gdXNlIGl0IiwgdXAKPj4+Pj4gdG8gdXMgdG8K
Pj4+Pj4gZGVzY3JpYmUgdGhpcyBjb3JyZWN0bHkgZm9yIHVzZXJzIHRvIHVuZGVyc3RhbmQuCj4+
Pj4gQnV0IFppY2Nsc20gZG9lc24ndCBtZWFuIG1pc2FsaWduZWQgYWNjZXNzZXMgYXJlIGluIEhX
LCBpdCBqdXN0IG1lYW5zCj4+Pj4gdGhleSdyZSBub3QgZ29pbmcgdG8gZXhwbG9kZS4KPj4+Cj4+
PiBUaGV5IG5ldmVyIGV4cGxvZGUgc2luY2UgaWYgdGhleSBhcmUgbm90IHN1cHBvcnRlZCBieSB0
aGUgSFcsIHdlIHJlbHkgb24KPj4+IFMtbW9kZSBlbXVsYXRpb24gYWxyZWFkeS4KPj4gRXhhY3Rs
eS4gWmljY2xzbSBpcyBqdXN0IGEgbmV3IG5hbWUgZm9yIHRoYXQgYmVoYXZpb3IuIFByb2ZpbGVz
IHRyeSB0bwo+PiBuYW1lIGV2ZXJ5IGJlaGF2aW9yLCBldmVuIHRoZSBvbmVzIHdlIHRha2UgZm9y
IGdyYW50ZWQuIFVuZm9ydHVuYXRlbHksCj4+IGxpa2UgaW4gdGhlIGNhc2Ugb2YgWmljY2xzbSwg
d2UgZG9uJ3QgbmVjZXNzYXJpbHkgZ2FpbiBhbnl0aGluZyBmcm9tCj4+IHRoZSBuZXcgbmFtZS4g
SW4gdGhpcyBjYXNlLCB3ZSBkb24ndCBnYWluIGEgd2F5IHRvIGF2b2lkIHByb2JpbmcuCj4gCj4g
Cj4gSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQgYnV0IGdpdmVuIHRoZSBtaXNhbGlnbmVkIHRyYXBz
IGV4aXN0LCBJIGNhbid0Cj4gZmluZCBhbm90aGVyIG1lYW5pbmcgdG8gWmljY2xzbSB0aGFuICJJ
J20gdGVsbGluZyB5b3UgdG8gdXNlIGl0Ii4KPiBaaWNjbHNtIGNhbid0IGJlIHVzZWQgdG8gZGVz
Y3JpYmUgYW4gT1MgYmVoYXZpb3VyIChpZSB0aGUgZW11bGF0aW9uIG9mCj4gbWlzYWxpZ25lZCBh
Y2Nlc3NlcykuCgpIaSBBbGV4LAoKU29tZSBTQkkgaW1wbGVtZW50YXRpb24gbWlnaHQgZGVjaWRl
IG5vdCB0byBkZWxlZ2F0ZSB0aGUgbWlzYWxpZ25lZCB0cmFwCmFuZCBub3QgZW11bGF0ZSBpdCBv
ciBwYXJ0aWFsbHkgZW11bGF0ZSBpdC4gSU1ITywgWmljY2xzbSBzaG91bGQKYWN0dWFsbHkgYmUg
YWR2ZXJ0aXNlZCBieSBTQkkgdG8gYWN0dWFsbHkgdGVsbCB0aGUgT1MgdGhhdCBtaXNhbGlnbmVk
CmFjY2Vzc2VzIGFyZSBzdXBwb3J0ZWQgKGV2ZW4gdGhvdWdoIHRoZXkgYXJlIHNsb3cpIHNpbmNl
IFppY2Nsc20gaXMgYQpwcm9maWxlIGV4dGVuc2lvbiAoYXQgbGVhc3QgaW4gaXRzIGZpcnN0IGRl
ZmluaXRpb24pLiBJIHRoaW5rIHdlIGNhbiBub3QKcmVseSBvbiBaaWNjbHNtIHRvIGRldGVybWlu
ZSB0aGF0IGFjY2Vzc2VzIGFyZSBmYXN0LiBNb3Jlb3ZlciwgaXQgc2VlbXMKbGlrZSBpdHMgZGVm
aW5pdGlvbiBldm9sdmVkIG92ZXIgdGltZSBhbmQgbGFja3MgY2xhcml0eSB0byBiZSByZWxpYWJs
ZS4KCj4gCj4gSSdtIGFsc28gaW5zaXN0aW5nIGJlY2F1c2Ugd2UgbmVlZCBhIGNvbXBpbGUtdGlt
ZSBoaW50IHdoaWNoIGFsbG93cyB1cwo+IHRvIGVuYWJsZSBIQVZFX0VGRklDSUVOVF9VTkFMSUdO
RURfQUNDRVNTIGluIHRoZSBrZXJuZWwgYW5kIFppY2Nsc20gaXMKPiBncmVhdCBzaW5jZSBpdCBp
cyByZXF1aXJlZCBpbiBSVkEyMy4gaWYgdGhhdCdzIG5vdCBaaWNjbHNtLCB0aGF0IG11c3QgYmUK
PiBhbm90aGVyIG5hbWVkIGZlYXR1cmUvZXh0ZW5zaW9uLgoKQXMgc2FpZCBpbiB0aGUgb3RoZXIg
dGhyZWFkLCBJIHRoaW5rIHdlIG1pZ2h0IGhhdmUgdG8gZW5hYmxlCkhBVkVfRUZGSUNJRU5UX1VO
QUxJR05FRF9BQ0NFU1MgYXMgYSBkZWZhdWx0IChvciB3aGF0ZXZlciBvcHRpb24gc2VsZWN0cwp0
aGF0IENPTkZJRykuIEhXIHdpdGhvdXQgbWlzYWxpZ25lZCBhY2Nlc3Mgc3VwcG9ydCBpbXBsZW1l
bnRhdGlvbiB3b3VsZApzdWZmZXIgZnJvbSB0aGF0IGNob2ljZSBidXQgd291bGQgc3RpbGwgd29y
ayAoYWx0aG91Z2ggcG9vcmx5KSB0aGFua3MgdG8KUy1tb2RlIGVtdWxhdGlvbi4gSWYgb25lIHdh
bnRzIHRvIHJ1biB0aGUga2VybmVsIG1vcmUgZWZmaWNpZW50bHkgb24Kc29tZSBzbWFsbGVyIGNo
aXAgd2l0aG91dCBhbnkgaGFyZHdhcmUgc3VwcG9ydCBmb3IgaXQsIHRoZW4gaXQgc2hvdWxkCmRp
c2FibGUgdGhhdCBjb25maWcuIEkgdGhpbmsgdGhhdCB3ZSBjYW4gbm90IGFjY29tbW9kYXRlIGJv
dGggd29ybGQKd2l0aG91dCBodXJ0aW5nIG9uZSBzaWRlIG9yIHRoZSBvdGhlciwgYSBjaG9pY2Ug
bmVlZHMgdG8gYmUgbWFkZS4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFdoYXQgZG8geW91IHN1
Z2dlc3QgdG8gbWFrZSBwcm9ncmVzcyBoZXJlPwo+IAo+IFRoYW5rcywKPiAKPiBBbGV4Cj4gCj4g
Cj4+Cj4+IFRoYW5rcywKPj4gZHJldwo+Pgo+Pj4KPj4+PiBXZSdkIHN0aWxsIG5lZWQgdGhlIHBy
b2JpbmcgdG8gZmluZCBvdXQKPj4+PiBpZiB0aGUgYWNjZXNzZXMgYXJlIGVtdWxhdGVkIChzbG93
KSBvciBodyAoZmFzdCkuIFdlIGF0IGxlYXN0IHdhbnQgdG8KPj4+PiBrbm93IHRoZSBhbnN3ZXIg
dG8gdGhhdCBxdWVzdGlvbiBiZWNhdXNlIHdlIGFkdmVydGlzZSBpdCB0byB1c2Vyc3BhY2UKPj4+
PiB0aHJvdWdoIGh3cHJvYmUuCj4+Pj4KPj4+PiAoQlRXLCBhbm90aGVyIHBybyBvZiB0aGUgY29t
bWFuZCBsaW5lIGlzIHRoYXQgaXQgY2FuIGJlIHVzZWQgdG8gdGVzdAo+Pj4+IGJvdGggc2xvdyBh
bmQgZmFzdCBwYXRocyB3aXRob3V0IHJlY29tcGlsaW5nLikKPj4+Pgo+Pj4+IFRoYW5rcywKPj4+
PiBkcmV3Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
