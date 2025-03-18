Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F8DC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Z7GDwG7QKBQZNPN9/K9CXVkQVS5JqUkjKe8BdsPbMk=; b=cYmsjTaC5zd3cO
	UIe78ng7HmXDRn5v+0vcmYZWvw/RlyQ8AM3oXd9fzP2qP50V742wyEDnz0OQ0d9yCQ9oIodXflYDn
	tJfXu9qMC+T/Q4gUtqwC2wxdugXqfnEO+egXc0HWN+53eXT0JEjZNk6XCkhYCRfD2im+0bzVrf826
	KZxMRURAT8eIi9bfmWMglOt6gu4Oja91c5kArx+6Uz1HIZkcDQ2YtfrMAPF8sw3PFQO1uKMk3voGa
	yTpdjUXhVpGfCvWpMEwtxxN1XCMZg9DBdkzb+kKjK89qPLSmtMEY8Ns0L5RHvkbdUKV7JMTC7OhK3
	/9N/X1sfC8OpCVmykC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXe6-000000068by-1D7I;
	Tue, 18 Mar 2025 14:10:18 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXdy-000000068a9-27Lu
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 14:10:12 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22401f4d35aso106374575ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742307009; x=1742911809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJlfQbKkZaT5zgjtlKURf8XEWEevxg5b6NR+MnbaBy4=;
        b=C7vhfthxgb5uUAUNAYJ0RCuXcUzR0AuKBPexnxOT8aaDqITDGOuDhzc+FZaNoXEVUX
         g2YDOxiqXD2dmPZ6BlDJQdq58nGgXWUBLc3VUaxi0NNHL07vkrOG+hGuv70qURuPeu5i
         vcMA8A8Iq7HSvhppwn+XOKzQMJet7DlZjcRtA5aLrzDCtaW0XJxQscy3QRC80Bpg3iy2
         IFqYL5rbyGA3Enc4r8XdKc1k05vkc2gILIwIUZKtvPHvHfGsWXJ39KetIAbi9kmNRMqk
         PFbNaTF3+1zaiQ0oPEbJiNn/OPevPM9QC/JVxRH9xpvCm5JflWJqfKlYOx39yEGXQcAA
         5wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742307009; x=1742911809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJlfQbKkZaT5zgjtlKURf8XEWEevxg5b6NR+MnbaBy4=;
        b=Ol6shgpqiDpfffxroKJZuUXrmdlRGbBrRrB4SN0cGaC1ZBpbP/B7ucTy9pOwGmJGDW
         737EREH0umAWoLI0PPhmvJ+rTKr980iicD8vKAvI+Hw+TqPEsp+DcxbqwA+tKreWZtdt
         3QnI+nwWY+/3jzjrQYizWByC6GoZzogBMzbZhf1Q/tIviQB2LC2H+AGK2VSAO2Lxrjdx
         15jEJ2eDD4UFIdUEFhRk0RYS7JU8AWkbyLn8H/rjryIyHDVcTOUvExA0q7yh8Jkek/dT
         X1HID6nTUFeUaUK0WkiikfCyfjCxHwZiSbSrnX/DTs+nU3lcRiNnVEDpTsoHGRaRKGQG
         GRuQ==
X-Gm-Message-State: AOJu0Yx1kVpqqMvsJIdhSIy6Z60mjmCY6wmDOcdBaPn9koECwYbbCjf9
	f6lLQjXsvQ9e856t7k/eEfGCrTFHJIS3lIluigL2PeEv3My3VBNCRrHTnpib1y1yUMf5jGygKYU
	sfpg=
X-Gm-Gg: ASbGncv4KmmvCgPJcQHKx4prTYRyxRmmOxp+tvVcP4hk5qjSQw03P34TF1qjtci9Uiv
	h5oFkh0IHcUIzsDaqXyFSjwAC+OtdhmulirkrdabMKUD7E6AEy6L1SgXdMHjqWFideQ3LQ1RZO4
	W5B5TR0KFugBn0LKQavWqBH/6/jfwsPzH+Ky8N87hLLL2chbWGUnpo8LeUEExu/Hj8u05xyiJJG
	RLGKxZeGtnSd3q5wfnNjYiYphWoJelW+gTPHJ8p8jgBIr0CphY1voZTrky2QzRr8TfzBUqJ+nVC
	snk4nyor7LzNyGSywM8TlEPcOZR/CP3QFyT71peuc6HC7p/LQYo2o8HkFkrjFD2Xsde5u0DbGHB
	AeIkPBgkE0dTKvxb8LUaY3zdR
X-Google-Smtp-Source: AGHT+IFUuNSszPzOvVIhdNPMgT9jchMGQU0sWHBhn3LDIjOpNzyeuRpJ5c0eiUiE0ijqUFJKnU7/7A==
X-Received: by 2002:a17:902:ecc3:b0:223:325c:89f6 with SMTP id d9443c01a7336-2262c51bc89mr46644695ad.10.1742307008987;
        Tue, 18 Mar 2025 07:10:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f2dsm94391105ad.140.2025.03.18.07.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:10:07 -0700 (PDT)
Message-ID: <ee650a6c-eed8-4a2b-82ee-868a784f26b3@rivosinc.com>
Date: Tue, 18 Mar 2025 15:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
To: Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 charlie@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <20250318-61be6a5455ea164b45d6dc64@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250318-61be6a5455ea164b45d6dc64@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_071010_810077_3E261EC4 
X-CRM114-Status: GOOD (  33.35  )
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

CgpPbiAxOC8wMy8yMDI1IDEwOjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVHVlLCBNYXIg
MTgsIDIwMjUgYXQgMDk6NDg6MjFBTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+PiBPbiBN
b24sIE1hciAxNywgMjAyNSBhdCAwMzozOTowMVBNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3Jv
dGU6Cj4+PiBIaSBEcmV3LAo+Pj4KPj4+IE9uIDA0LzAzLzIwMjUgMTM6MDAsIEFuZHJldyBKb25l
cyB3cm90ZToKPj4+PiBBbGxvdyBza2lwcGluZyBzY2FsYXIgYW5kIHZlY3RvciB1bmFsaWduZWQg
YWNjZXNzIHNwZWVkIHRlc3RzLiBUaGlzCj4+Pj4gaXMgdXNlZnVsIGZvciB0ZXN0aW5nIGFsdGVy
bmF0aXZlIGNvZGUgcGF0aHMgYW5kIHRvIHNraXAgdGhlIHRlc3RzIGluCj4+Pj4gZW52aXJvbm1l
bnRzIHdoZXJlIHRoZXkgcnVuIHRvbyBzbG93bHkuIEFsbCBDUFVzIG11c3QgaGF2ZSB0aGUgc2Ft
ZQo+Pj4+IHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQuCj4+Pgo+Pj4gSSdtIG5vdCBhIGJpZyBmYW4g
b2YgdGhlIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIsIHRoaXMgaXMgbm90IHdoZXJlIHdlIHNob3Vs
ZAo+Pj4gcHVzaCB1YXJjaCBkZWNpc2lvbnMgYmVjYXVzZSB0aGVyZSBjb3VsZCBiZSBtYW55IG90
aGVyIGluIHRoZSBmdXR1cmUsIHRoZQo+Pj4gYmVzdCBzb2x1dGlvbiB0byBtZSBzaG91bGQgYmUg
aW4gRFQvQUNQSSBhbmQgc2luY2UgdGhlIERUIGZvbGtzLCBhY2NvcmRpbmcKPj4+IHRvIFBhbG1l
ciwgc2h1dCBkb3duIHRoaXMgc29sdXRpb24sIGl0IHJlbWFpbnMgdXNpbmcgYW4gZXh0ZW5zaW9u
Lgo+Pj4KPj4+IEkgaGF2ZSBiZWVuIHJlYWRpbmcgYSBiaXQgYWJvdXQgdW5hbGlnbmVkIGFjY2Vz
c2VzLiBaaWNjbHNtIHdhcyBkZXNjcmliZWQgYXMKPj4+ICJFdmVuIHRob3VnaCBtYW5kYXRlZCwg
bWlzYWxpZ25lZCBsb2FkcyBhbmQgc3RvcmVzIG1pZ2h0IGV4ZWN1dGUgZXh0cmVtZWx5Cj4+PiBz
bG93bHkuIFN0YW5kYXJkIHNvZnR3YXJlIGRpc3RyaWJ1dGlvbnMgc2hvdWxkIGFzc3VtZSB0aGVp
ciBleGlzdGVuY2Ugb25seQo+Pj4gZm9yIGNvcnJlY3RuZXNzLCBub3QgZm9yIHBlcmZvcm1hbmNl
LiIgaW4gcnZhMjAvMjIgYnV0ICpub3QqIGluIHJ2YTIzLiBTbwo+Pj4gd2hhdCBhYm91dCB1c2lu
ZyB0aGlzICJob2xlIiBhbmQgY29uc2lkZXIgdGhhdCBhIHBsYXRmb3JtIHRoYXQgKmFkdmVydGlz
ZXMqCj4+PiBaaWNjbHNtIG1lYW5zIGl0cyB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIGZhc3Q/IEFm
dGVyIGludGVybmFsIGRpc2N1c3Npb24sIEl0Cj4+PiBhY3R1YWxseSBkb2VzIG5vdCBtYWtlIHNl
bnNlIHRvIGFkdmVydGlzZSBaaWNjbHNtIGlmIHRoZSBwbGF0Zm9ybSBhY2Nlc3Nlcwo+Pj4gYXJl
IHNsb3cgcmlnaHQ/Cj4+Cj4+IFRoaXMgdG9waWMgcG9wcyB1cCBldmVyeSBzbyBvZnRlbiwgaW5j
bHVkaW5nIGluIHllc3RlcmRheSdzIHNlcnZlcgo+PiBwbGF0Zm9ybSBURyBjYWxsLiBJbiB0aGF0
IGNhbGwsIGFuZCwgYWZhaWN0LCBldmVyeSBvdGhlciB0aW1lIGl0IGhhcwo+PiBwb3BwZWQgdXAs
IHRoZSByZXN1bHQgaXMgdG8gcmVpdGVyYXRlIHRoYXQgSVNBIGV4dGVuc2lvbnMgbmV2ZXIgc2F5
Cj4+IGFueXRoaW5nIGFib3V0IHBlcmZvcm1hbmNlLiBTbywgWmljY2xzbSB3aWxsIG5ldmVyIG1l
YW4gZmFzdCBhbmQgd2UKPj4gd29uJ3QgbGlrZWx5IGJlIGFibGUgdG8gYWRkIGFueSBleHRlbnNp
b24gdGhhdCBkb2VzLgo+Pgo+Pj4KPj4+IGFybTY0IGZvciBleGFtcGxlIGNvbnNpZGVycyB0aGF0
IGFybXY4IGhhcyBmYXN0IHVuYWxpZ25lZCBhY2Nlc3NlcyBhbmQgY2FuCj4+PiB0aGVuIGVuYWJs
ZSBIQVZFX0VGRklDSUVOVF9BTElHTkVEX0FDQ0VTUyBpbiB0aGUga2VybmVsLCBldmVuIHRob3Vn
aCBzb21lCj4+PiB1YXJjaHMgYXJlIHNsb3cuIERpc3Ryb3Mgd2lsbCB2ZXJ5IGxpa2VseSB1c2Ug
cnZhMjMgYXMgYmFzZWxpbmUgc28gdGhleSB3aWxsCj4+PiBlbmFibGUgWmljY2xzbSB3aGljaCB3
b3VsZCBhbGxvdyB1cyB0byB0YWtlIGFkdmFudGFnZSBvZiB0aGlzIHRvbywgd2l0aG91dAo+Pj4g
dGhpcywgd2UgbG9zZSBhIGxvdCBvZiBwZXJmIGltcHJvdmVtZW50IGluIHRoZSBrZXJuZWwsIHNl
ZQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMTIyNTA0NDIwNy4zODIxLTEt
anN6aGFuZ0BrZXJuZWwub3JnLy4KPj4+Cj4+PiBPciB3ZSBjb3VsZCBoYXZlIGEgbmV3IG5hbWVk
IGZlYXR1cmUgZm9yIHRoaXMsIGV2ZW4gdGhvdWdoIGl0J3Mgd2VpcmQgdG8KPj4+IGhhdmUgYSBu
YW1lZCBmZWF0dXJlIHdoaWNoIHdvdWxkIGJhc2ljYWxsecKgIG1lYW4gIlppY2Nsc20gaXMgZmFz
dCIuIFdlIGRvbid0Cj4+PiBoYXZlLCBmb3IgZXhhbXBsZSwgYSBuYW1lZCBmZWF0dXJlIHRvIHNh
eSAiWmljYm96IGlzIGZhc3QiIGJ1dCBnaXZlbiB0aGUKPj4+IHZhZ3VlIHdvcmRpbmcgaW4gdGhl
IHByb2ZpbGUgc3BlYywgbWF5YmUgd2UgY2FuIGFzayBmb3Igb25lIGluIHRoYXQgY2FzZT8KPj4+
Cj4+PiBTb3JyeSBmb3IgdGhlIGxhdGUgcmV2aWV3IGFuZCBmb3IgdHJpZ2dlcmluZyB0aGlzIGRl
YmF0ZS4uLgo+Pgo+PiBObyBwcm9ibGVtLCBsZXQncyB0cnkgdG8gcGljayB0aGUgYmVzdCBvcHRp
b24uIEknbGwgdHJ5IGxpc3RpbmcgYWxsIHRoZQo+PiBvcHRpb25zIGFuZCB0aGVyZSBwcm9zL2Nv
bnMuCj4+Cj4+IDEuIExlYXZlIGFzIGlzLCB3aGljaCBpcyB0byBhbHdheXMgcHJvYmUKPj4gICAg
cHJvOiBOb3RoaW5nIHRvIGRvCj4+ICAgIGNvbjogTm90IGlkZWFsIGluIGFsbCBlbnZpcm9ubWVu
dHMKPj4KPj4gMi4gTmV3IERUL0FDUEkgZGVzY3JpcHRpb24KPj4gICAgcHJvOiBEZXNjcmliaW5n
IHdoZXRoZXIgb3Igbm90IG1pc2FsaWduZWQgYWNjZXNzZXMgYXJlIGltcGxlbWVudGVkIGluCj4+
ICAgICAgICAgSFcgKHdoaWNoIHByZXN1bWFibHkgbWVhbnMgZmFzdCkgaXMgc29tZXRoaW5nIHRo
YXQgc2hvdWxkIGJlIGRvbmUKPj4gCWluIEhXIGRlc2NyaXB0aW9ucwo+PiAgICBjb246IFdlJ2xs
IG5lZWQgdG8gbGl2ZSB3aXRoIHByb2JpbmcgdW50aWwgd2UgY2FuIGdldCB0aGUgZGVzY3JpcHRp
b25zCj4+ICAgICAgICAgZGVmaW5lZCwgd2hpY2ggbWF5IGJlIG5ldmVyIGlmIHRoZXJlJ3MgdG9v
IG11Y2ggb3Bwb3NpdGlvbgo+Pgo+PiAzLiBDb21tYW5kIGxpbmUKPj4gICAgcHJvOiBFYXN5IGFu
ZCBzZXJ2ZXMgaXRzIHB1cnBvc2UsIHdoaWNoIGlzIHRvIHNraXAgcHJvYmluZyBpbiB0aGUKPj4g
ICAgICAgICBlbnZpcm9ubWVudHMgd2hlcmUgcHJvYmluZyBpcyBub3QgZGVzaXJlZAo+PiAgICBj
b246IFlldCBhbm90aGVyIGNvbW1hbmQgbGluZSBvcHRpb24gKHdoaWNoIHdlIG1heSB3YW50IHRv
IGRlcHJlY2F0ZQo+PiAgICAgICAgIHNvbWVkYXkpCj4+Cj4+IDQuIE5ldyBJU0EgZXh0ZW5zaW9u
Cj4+ICAgIHBybzogRWFzeSB0byBhZGQgdG8gSFcgZGVzY3JpcHRpb25zCj4+ICAgIGNvbjogTm90
IGxpa2VseSB0byBnZXQgaXQgdGhyb3VnaCByYXRpZmljYXRpb24KPj4KPj4gNS4gTmV3IFNCSSBG
V0ZUIGZlYXR1cmUKPj4gICAgcHJvOiBQcm9iYWJseSBlYXNpZXIgdG8gZ2V0IHRocm91Z2ggcmF0
aWZpY2F0aW9uIHRoYW4gYW4gSVNBIGV4dGVuc2lvbgo+PiAgICBjb246IEluc3RlYWQgb2YgcHJv
YmluZywga2VybmVsIHdvdWxkIGhhdmUgdG8gYXNrIFNCSSAtLSB3b3VsZCB0aGF0Cj4+ICAgICAg
ICAgZXZlbiBiZSBmYXN0ZXI/IFdpbGwgYWxsIHRoZSBlbnZpcm9ubWVudHMgdGhhdCB3YW50IHRv
IHNraXAKPj4gCXByb2JpbmcgZXZlbiBoYXZlIGEgY29tcGxldGUgU0JJPwoKSGkgQW5kcmV3CgpG
V0ZUIGlzIG5vdCByZWFsbHkgbWVhbnQgdG8gInF1ZXJ5IiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBm
aXJtd2FyZSwKZndmdF9zZXQoKSB3b3VsZG4ndCBoYXZlIGFueXRoaW5nIHRvIGFjdHVhbGx5IHNl
dC4gVGhlIHByb2JsZW0gd291bGQKYWxzbyBqdXN0IGJlIHB1c2hlZCBhd2F5IGZyb20gTGludXgg
YnV0IHdvdWxkIHByb2JhYmx5IHN0aWxsIHJlcXVpcmUKc3BlY2lmaWNhdGlvbiBhbnl3YXkuCgo+
Pgo+PiA2LiA/Pwo+IAo+IEkgZm9yZ290IG9uZSwgd2hpY2ggd2FzIHYxIG9mIHRoaXMgc2VyaWVz
IGFuZCBhbHJlYWR5IHJlamVjdGVkLAo+IAo+ICA2LiBVc2UgSUQgcmVnaXN0ZXJzCj4gICAgIHBy
bzogTm9uZSBvZiB0aGUgYWJvdmUgY29ucywgaW5jbHVkaW5nIHRoZSBtYWluIGNvbiB3aXRoIHRo
ZSBjb21tYW5kCj4gICAgICAgICAgbGluZSwgd2hpY2ggaXMgdGhhdCB0aGVyZSBjb3VsZCBiZSBt
YW55IG90aGVyIGRlY2lzaW9ucyBpbiB0aGUKPiAJIGZ1dHVyZSwgaW1wbHlpbmcgd2UgY291bGQg
bmVlZCBtYW55IG1vcmUgY29tbWFuZCBsaW5lIG9wdGlvbnMuCj4gICAgIGNvbjogQSBzbGlwcGVy
eSBzbG9wZS4gV2UgZG9uJ3Qgd2FudCB0byBvcGVuIHRoZSBkb29yIHRvCj4gICAgICAgICAgZmVh
dHVyZXMtYnktaWRyZWdzLiAoSG93ZXZlciwgd2UgY2FuIGF0IGxlYXN0IGFsd2F5cyBjbG9zZSB0
aGUKPiAJIGRvb3IgYWdhaW4gaWYgYmV0dGVyIG1lY2hhbmlzbXMgYmVjb21lIGF2YWlsYWJsZS4g
Q29tbWFuZAo+IAkgbGluZXMgd291bGQgbmVlZCB0byBiZSBkZXByZWNhdGVkLCBidXQgZmVhdHVy
ZS1ieS1pZHJlZyBjb2RlCj4gCSBjYW4ganVzdCBiZSBkZWxldGVkLikKCk15IHByZWZlcnJlZCBv
cHRpb24gd291bGQgaGF2ZSBiZWVuIG9wdGlvbiAyLiBCVFcsIHdoYXQgYXJlIHRoZQphcmd1bWVu
dHMgdG8gcHVzaCBhd2F5IHRoZSBkZXNjcmlwdGlvbiBvZiBtaXNhbGlnbmVkIGFjY2VzcyBzcGVl
ZCBvdXQgb2YKZGV2aWNlLXRyZWUgPyB0aGF0J3MgYWxtb3N0IGV4YWN0bHkgd2hhdCB0aGUgZGV2
aWNlLXRyZWUgaXMgbWVhbnQgdG8gZG8sCmllIGRlc2NyaWJlIGhhcmR3YXJlLgoKQXMgYSBsYXN0
IHJlc29ydCBzb2x1dGlvbiwgSSdtIGZvciBvcHRpb24gMy4gVGhlcmUgYWxyZWFkeSBleGlzdHMg
YQpjb21tYW5kIGxpbmUgb3B0aW9uIHRvIHByZXNldCB0aGUgamlmZmllcy4gVGhpcyBpcyBhbG1v
c3QgdGhlIHNhbWUgdXNlCmNhc2UgdGhhdCB3ZSBoYXZlLCBpZSBoYXZlIGEgZmFzdGVyIGJvb3Qg
dGltZSBieSBwcmVzZXR0aW5nIHRoZQptaXNhbGlnbmVkIGFjY2VzcyBwcm9iaW5nLgoKSU1ITywg
c2tpcHBpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgcHJvYmluZyBzcGVlZCBpcyBvcnRob2dvbmFsIHRv
CkVGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTLiBvbmUgaXMgZG9uZSBhdCBydW50aW1lIGFuZCBh
bGxvd3MgdGhlCnVzZXJzcGFjZSB0byBrbm93IHRoZSBzcGVlZCBvZiBtaXNhbGlnbmVkIGFjY2Vz
c2VzLCB0aGUgb3RoZXIgb25lIGF0CmNvbXBpbGUgdGltZSB0byBpbXByb3ZlIGtlcm5lbCBzcGVl
ZC4gRGVwZW5kaW5nIG9uIHdoaWNoIHN5c3RlbSB3ZSB3YW50CnRvIHN1cHBvcnQsIHdlIG1pZ2h0
IG5lZWQgdG8gZW5hYmxlIEVGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGFzIGEKZGVmYXVsdCwg
YWxsb3dpbmcgZm9yIHRoZSBtb3N0IExpbnV4ICJjYXBhYmxlIiBjaGlwcyB0byBoYXZlIGZ1bGwK
cGVyZm9ybWFuY2VzLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtzLAo+IGRyZXcKPiAK
Pj4KPj4gSSdtIHZvdGluZyBmb3IgKDMpLCB3aGljaCBpcyB3aHkgSSBwb3N0ZWQgdGhpcyBwYXRj
aHNldCwgYnV0IEknbSBoYXBweQo+PiB0byBoZWFyIG90aGVyIHZvdGVzIG9yIG90aGVyIHByb3Bv
c2FscyBhbmQgZGlzY3Vzcy4KPj4KPj4gVGhhbmtzLAo+PiBkcmV3CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
