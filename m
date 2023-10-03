Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1333E75434
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3CwesM7+cQHOjNCdPtCAZFh829LFUh1tT+bG2VBGDQ=; b=HQCOc4JYwkLAaI
	f+rpxvtqf9n5jV5XT3rNi2OoDjV7cQ3Z1k/T+9uQVETYVfZWXSJM4tqamKCQ4NoJKcU0bqbSPv2Pk
	xF/ym/SQ7yCF6Fwj2pQrFcgvdifYlGNVKVnl46lkyd3Vp41++/O6o3+i8QycIYYmLmFNBrpDROWWt
	hf5oiz/uApS6eQEtsFdm4AAEuVFl1DmcYbdwqznKiXtu0FZ/WyrFi+PWCNRQJLPJLq8zZP9olz2rC
	przzKexrEXT9L3TU5RSskeWFTkODbXR474aHJQsOT2HDPxynyGcqQbY8LPCFseF0q1BwZooUwrW1N
	gKcuB94Pjjr5IDLn5UUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaW4-00E89i-3A;
	Tue, 03 Oct 2023 08:12:28 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaW0-00E88y-3C
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 08:12:27 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c15463e031so1044741fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696320741; x=1696925541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7a5n0Ui2q8c2Q2RMg99Pm73cLNmhODZZUiYNdq+8QsU=;
        b=loeFvbPRGpdkTW7m40cWUSM1Jq7j2Bm32aoYrCg8SfZPGipooeuvmtTSTTc1KVJx74
         AHH9lWl/OXptmIF9PkywKJkovXhZBLllhITMWPohRmkbS7ydXfHCWI9TPKoB+GNmtRCL
         jjSVsBWK4zsL20t/SrWAvj72PjUCdOUiYDkmgBrRptSQJeGu51gASC1vL+1IiLHvIoBG
         d5UiU/Z+rdBBchia1aNlRpYg6sbpcigwNc1O0PcbAxFhXBz7rFX1eTDtsZVny9yQT6Qv
         16LB3WSuB14wZDWs4Av4VaVnLvz+1FGZ4/J6ibbvbQ+4LN/n3vQRVzUnxV4+wOE9llP4
         GFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696320741; x=1696925541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7a5n0Ui2q8c2Q2RMg99Pm73cLNmhODZZUiYNdq+8QsU=;
        b=my2BS0S4m995RTeLpKOhoqJ093NK4ffyhHTwfIAKyuVxZ0iYJGDe4mO03qWZxmVVxZ
         rXXnVaNB8ojiQ7VjA1VOV1GLzN5C/oWOBo/TcBdDsMYEPq16Vg0q4Nqp3rfB1kW3Gazk
         2tpt5s9exFVw49zZlW0gnNEFci4/0DGSHXoyGH1f6HuSGFqE4uxaESS6oqWT508I81lK
         6FJuaQcdn+ckAq2J6gcmK2raXjveZ6MZ8hmJcx99Xx4l2QrS74A6/lnRTNd3M1vYc4t2
         +kICtpOF0tAEVmsEhxxAbofsoFy0beTuJWzCLW2G8nb0woGh5+HeYoLhqXRbri9+Aiot
         EA7A==
X-Gm-Message-State: AOJu0YzAmma833U+MwZ15E20W2AQYJJmmFMPNh+ExwhoYLWTo+v/iV/W
	hK9GzXMa5kaxqW4cLuQZ3r+Gzw==
X-Google-Smtp-Source: AGHT+IGeLm22wz4BrxQ6tqBbXb7fGJMmOKsLLYWRdAHJgLMrzddEbfDFnWwERV9TNf8QEg0hRNUVbg==
X-Received: by 2002:a2e:b953:0:b0:2b9:e10b:a511 with SMTP id 19-20020a2eb953000000b002b9e10ba511mr8835141ljs.0.1696320740794;
        Tue, 03 Oct 2023 01:12:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:5e96:db9d:a127:1934? ([2a01:e0a:999:a3a0:5e96:db9d:a127:1934])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0ac400b00405442edc69sm8790540wmr.14.2023.10.03.01.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 01:12:20 -0700 (PDT)
Message-ID: <c7fa544a-664e-48c1-a9e0-09085a221862@rivosinc.com>
Date: Tue, 3 Oct 2023 10:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: ron minnich <rminnich@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Topel?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Maslowski <cyrevolt@googlemail.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
 <20231002-spearman-doze-70cc026ac13e@spud>
 <693e6584-1e66-48c0-aa7c-61d9f88abd4c@rivosinc.com>
 <CAP6exYLtQuyqMgG6jRAhizp-52ebu3OLNSXe8a8xvLALYFD3kA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAP6exYLtQuyqMgG6jRAhizp-52ebu3OLNSXe8a8xvLALYFD3kA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_011225_244331_D7EC1385 
X-CRM114-Status: GOOD (  28.43  )
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

CgpPbiAwMi8xMC8yMDIzIDE3OjMyLCByb24gbWlubmljaCB3cm90ZToKPiBUaGlzIHdhcyBhIHZl
cnkgaW50ZXJlc3RpbmcgcmVhZC4gT25lIG90aGVyIHRob3VnaHQgY3Jvc3NlZCBteSBtaW5kLAo+
IHdoaWNoIGlzIHRoYXQgYSBSSVNDLVYgaW1wbGVtZW50YXRpb24gbWlnaHQgbWFrZSB0aGUgYWxp
Z25tZW50Cj4gZGVsZWdhdGlvbiBoYXJkLXdpcmVkIHRvIGFsd2F5cyBkZWxlZ2F0ZSB0byBTIG1v
ZGUuIEkuZSwgdGhlIGJpdCBtaWdodAo+IGJlIFdBUkwgYW5kIGFsd2F5cyAxLiBGb3Igd2hhdCBJ
J20gZG9pbmcsIHRoaXMgd291bGQgYWN0dWFsbHkgYmUKPiBwcmV0dHkgY29udmVuaWVudC4gSnVz
dCB3YW50IHRvIG1ha2Ugc3VyZSB0aGlzIGNvZGUgY2FuIGFjY29tbW9kYXRlCj4gdGhhdCAtLSB3
ZHl0PwoKSGkgUm9uLAoKVGhpcyBzZXJpZXMgZG9lcyBub3QgcmVhbGx5IGNhcmUgYWJvdXQgImhv
dyIgbWlzYWxpZ25lZCBsb2FkL3N0b3JlIGFyZQpkZWxlZ2F0ZWQsIGl0IG9ubHkgdHJpZXMgdG8g
Y2hlY2sgaWYgbWlzYWxpZ25lZCBsb2FkL3N0b3JlIGFyZSBoYW5kbGVkCmJ5IHRoZSBrZXJuZWwu
IFNvIHdoYXRldmVyIHlvdSBkZWNpZGUgdG8gZG8gdG8gZGVsZWdhdGUgdGhhdCBpcyBhIGJpdApv
dXQgb2YgdGhlIHNjb3BlIG9mIHRoaXMgc2VyaWVzLgoKPiAKPiBXZSBoYXZlIGZvdW5kIGxvdHMg
b2YgdmFsdWUgaW4gb3VyIGV4cGVyaW1lbnRzIHdpdGggZGVsZWdhdGluZwo+IGFsaWdubWVudCB0
cmFwcyB0byBMaW51eCAtLSBub3QgbGVhc3QgYmVjYXVzZSB0aGV5IHRlbmQgdG8gbG9jYXRlCj4g
cHJvYmxlbXMgaW4gdGhlIGtlcm5lbCA6LSkgLS0gd2UndmUgZm91bmQgaXNzdWVzIGluIG1vZHVs
ZSBsb2FkaW5nLAo+IGVhcmx5IHN0YXJ0dXAgKHRoZXJlJ3MgYSBuZWVkZWQgLmFsaWduMiBkaXJl
Y3RpdmUgZm9yIHNiaSBzZWNvbmRhcnkKPiBzdGFydHVwLCBBRkFJQ1QpIGFuZCB0aGUgdGltaW5n
IGNvZGUgZm9yIG1pc2FsaWduZWQgbG9hZC9zdG9yZQo+IGhhbmRsaW5nLj4KPiBJIGRvbid0IGtu
b3cgaG93IHlvdSB0ZXN0IHRoaXMgdW5hbGlnbmVkIHRyYXAgaGFuZGxpbmcsIGJ1dCBpdCBtaWdo
dAo+IGJlIHdvcnRod2hpbGUgdG8gd29yayB0aGF0IG91dC4gWW91IGNhbiB0ZXN0IHZpYSBvcmVi
b290IGFuZCB0aGUKPiB2aXNpb25maXZlMiwgc2F2ZSB3ZSBoYXZlIG5vdCBmaWd1cmVkIG91dCB3
aHkgU01QIHN0YXJ0dXAgaXMgZ29pbmcKPiB3cm9uZywgeWV0IDotKSwgc28gd2UncmUgbm90IGFz
IGZlYXR1cmUtY29tcGxldGUgYXMgbmVlZGVkLiBCdXQgc29vbi4KCkkgdGVzdCB0aGF0IG9uIHNw
aWtlICh3aGljaCBkb2VzIG5vdCBoYW5kbGUgbWlzYWxpZ25lZCBhY2Nlc3NlcyBjb250cmFyeQp0
byBxZW11KSB1c2luZyBhIHVzZXJzcGFjZSBwcm9ncmFtIHRoYXQgYWN0dWFsbHkgZXhlcmNpc2Ug
YWxsIGtpbmQgb2YKc3RhbmRhcmQgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMgYXMgd2VsbCBhcyBG
UFUgb25lcyB3aXRoIGRpZmZlcmVudApyZWdpc3RlcnMuIFJlZ2FyZGluZyB0aGUga2VybmVsLCB5
b3UgYXJlIHJpZ2h0IHRoYXQgSSBtaWdodCBiZSBsYWNraW5nIGEKZmV3IHRlc3RzIHRob3VnaC4g
SSdsbCBhbHNvIGNvbnNpZGVyIHVzaW5nIGEgdmlzaW9uZml2ZTIgYm9hcmQgdG8KdmFsaWRhdGUg
dGhhdCBvbiByZWFsIGhhcmR3YXJlLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtzIQo+
IAo+IE9uIE1vbiwgT2N0IDIsIDIwMjMgYXQgNToxOeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDAyLzEwLzIwMjMgMTI6NDks
IENvbm9yIERvb2xleSB3cm90ZToKPj4+IE9uIE1vbiwgT2N0IDAyLCAyMDIzIGF0IDA5OjQwOjA0
QU0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMzAvMDkv
MjAyMyAxMToyMywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+PiBPbiBUdWUsIFNlcCAyNiwgMjAy
MyBhdCAwNTowMzowOVBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4+PiBTaW5j
ZSBjb21taXQgNjFjYWRiOSAoIlByb3ZpZGUgbmV3IGRlc2NyaXB0aW9uIG9mIG1pc2FsaWduZWQg
bG9hZC9zdG9yZQo+Pj4+Pj4gYmVoYXZpb3IgY29tcGF0aWJsZSB3aXRoIHByaXZpbGVnZWQgYXJj
aGl0ZWN0dXJlLiIpIGluIHRoZSBSSVNDLVYgSVNBCj4+Pj4+PiBtYW51YWwsIGl0IGlzIHN0YXRl
ZCB0aGF0IG1pc2FsaWduZWQgbG9hZC9zdG9yZSBtaWdodCBub3QgYmUgc3VwcG9ydGVkLgo+Pj4+
Pj4gSG93ZXZlciwgdGhlIFJJU0MtViBrZXJuZWwgdUFCSSBkZXNjcmliZXMgdGhhdCBtaXNhbGln
bmVkIGFjY2Vzc2VzIGFyZQo+Pj4+Pj4gc3VwcG9ydGVkLiBJbiBvcmRlciB0byBzdXBwb3J0IHRo
YXQsIHRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgUy1tb2RlCj4+Pj4+PiBoYW5kbGluZyBv
ZiBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFzIHdlbGwgc3VwcG9ydCBmb3IgcHJjdGwoUFJfVU5BTElH
TikuCj4+Pj4+Pgo+Pj4+Pj4gSGFuZGxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgaW4ga2VybmVsIGFs
bG93cyBmb3IgYSBmaW5lciBncmFpbiBjb250cm9sCj4+Pj4+PiBvZiB0aGUgbWlzYWxpZ25lZCBh
Y2Nlc3NlcyBiZWhhdmlvciwgYW5kIHRoYW5rcyB0byB0aGUgcHJjdGwgY2FsbCwgY2FuCj4+Pj4+
PiBhbGxvdyBkaXNhYmxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgZW11bGF0aW9uIHRvIGdlbmVyYXRl
IFNJR0JVUy4gVXNlcgo+Pj4+Pj4gc3BhY2UgY2FuIHRoZW4gb3B0aW1pemUgaXRzIHNvZnR3YXJl
IGJ5IHJlbW92aW5nIHN1Y2ggYWNjZXNzIGJhc2VkIG9uCj4+Pj4+PiBTSUdCVVMgZ2VuZXJhdGlv
bi4KPj4+Pj4+Cj4+Pj4+PiBDdXJyZW50bHksIHRoaXMgc2VyaWVzIGlzIHVzZWZ1bCBmb3IgcGVv
cGxlIHRoYXQgdXNlcyBhIFNCSSB0aGF0IGRvZXMKPj4+Pj4+IG5vdCBoYW5kbGVkIG1pc2FsaWdu
ZWQgdHJhcHMuIEluIGEgbmVhciBmdXR1cmUsIHRoaXMgc2VyaWVzIHdpbGwgbWFrZQo+Pj4+Pj4g
dXNlIGEgU0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVzdCBkZWxlZ2F0aW9uIG9m
IHRoZQo+Pj4+Pj4gbWlzYWxpZ25lZCBsb2FkL3N0b3JlIHRyYXBzIHRvIHRoZSBTLW1vZGUgc29m
dHdhcmUuIFRoaXMgZXh0ZW5zaW9uIGhhcwo+Pj4+Pj4gYmVlbiBzdWJtaXR0ZWQgZm9yIHJldmll
dyB0byB0aGUgcmlzY3YgdGVjaC1wcnMgZ3JvdXAuIEFuIE9wZW5TQkkKPj4+Pj4+IGltcGxlbWVu
dGF0aW9uIGZvciB0aGlzIHNwZWMgaXMgYXZhaWxhYmxlIGF0IFsyXS4KPj4+Pj4+Cj4+Pj4+PiBU
aGlzIHNlcmllcyBjYW4gYmUgdGVzdGVkIHVzaW5nIHRoZSBzcGlrZSBzaW11bGF0b3IgWzNdIGFu
ZCBhbiBvcGVuU0JJCj4+Pj4+PiB2ZXJzaW9uIFs0XSB3aGljaCBhbGxvd3MgdG8gYWx3YXlzIGRl
bGVnYXRlIG1pc2FsaWduZWQgbG9hZC9zdG9yZSB0bwo+Pj4+Pj4gUy1tb2RlLgo+Pj4+Pgo+Pj4+
PiBTb21lIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgZG8gbm90IGJ1aWxkIGZvciBhbnkgY29uZmln
cywgc29tZSBhcmUKPj4+Pj4gYnJva2VuIGZvciBjbGFuZyBidWlsZHMgYW5kIG90aGVycyBhcmUg
YnJva2VuIGZvciBub21tdS4gUGxlYXNlIHRyeSB0bz4gYnVpbGQgdGVzdCB0aGlzIG1vcmUgdGhv
cm91Z2hseSBiZWZvcmUgeW91IHN1Ym1pdCB0aGUgbmV4dCB2ZXJzaW9uLgo+Pj4+Cj4+Pj4gSGkg
Q29ub3IsCj4+Pj4KPj4+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgSSdsbCBjaGVjayB0aGF0
Lgo+Pj4+Cj4+Pj4+Cj4+Pj4+IEFsc28sIEFJVUksIHRoaXMgc2VyaWVzIHNob3VsZCBiZSBtYXJr
ZWQgUkZDIHNpbmNlIHRoZSBTQkkgZXh0ZW5zaW9uCj4+Pj4+IHRoaXMgcmVsaWVzIG9uIGhhcyBu
b3QgYmVlbiBmcm96ZW4uCj4+Pj4KPj4+PiBUaGlzIHNlcmllcyBkb2VzIG5vdCBhY3R1YWxseSB1
c2VzIHRoZSBTQkkgZXh0ZW5zaW9uIGJ1dCBwcm92aWRlcyBhIHdheQo+Pj4+IHRvIGRldGVjdCBp
ZiBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZSBub3QgaGFuZGxlZCBieSBoYXJkd2FyZSBub3IgYnkg
dGhlCj4+Pj4gU0JJLiBJdCBoYXMgYmVlbiByZXBvcnRlZCBieSBSb24gJiBEYW5pZWwgdGhleSB0
aGV5IGhhdmUgYSBtaW5pbWFsIFNCSQo+Pj4+IGltcGxlbWVudGF0aW9uIHRoYXQgZG9lcyBub3Qg
aGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgYW5kIHRoYXQgdGhleQo+Pj4+IHdvdWxkIGxpa2Ug
dG8gbWFrZSB1c2Ugb2YgdGhlIFBSX1NFVF9VTkFMSUdOIGZlYXR1cmUuIFRoaXMgaXMgd2hhdCB0
aGlzCj4+Pj4gc2VyaWVzIGFkZHJlc3NlcyAoYW5kIHRodXMgZG9lcyBub3QgZGVwZW5kIG9uIHRo
ZSBtZW50aW9uZWQgU0JJIGV4dGVuc2lvbikuCj4+Pgo+Pj4gQWgsIEkgbXVzdCBoYXZlIG1pc3Jl
YWQgdGhlbi4gQXBvbG9naWVzLgo+Pgo+PiBObyB3b3JyaWVzLCBtYXliZSBJIHNob3VsZCBhY3R1
YWxseSByZW1vdmUgdGhpcyBmcm9tIHRoZSBjb3ZlciBsZXR0ZXIgdG8KPj4gYXZvaWQgYW55IGNv
bmZ1c2lvbiAhCj4+Cj4+IENsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
