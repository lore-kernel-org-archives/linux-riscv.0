Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EF4C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 21:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvgpnI/d0PDqtti5GZvMHGR+53bpBLkZTqiTsfIJKAk=; b=1uSv8o5ymItfXZ
	aUZIqAh2X7hujUtRQxr4pLRFwrfJ0w79A3A945mh+cMT7nzqmnXJ62ndge71GSlWoR9r9sAHaushB
	SEuC1yCPlXOhcjulh3d1PDaC15s3n9Pz+4zNuhQRa3NWjVKywQB4xXYNtwgVfGanNvEAeQHDMdbUg
	WnqAEWUg33OpPiLsRaFcToOmCYIi6o5/BWnzLH536STwEy0iZRaFuzdC4m6EXQme3eZBJLb6SnCgV
	egGSwj2P/xnihTUzyQms21Mv6mB6yxn3+OxftnkHnQ5F44DcNoNGhgsHAW3uZxkXBOxUu9e3D9EMg
	56xZNSkemauKnOX4EFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJgRT-0000000GgR9-3KDX;
	Tue, 18 Jun 2024 21:32:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJgRR-0000000GgQf-1WgW
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 21:32:38 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7042882e741so4905458b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 14:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718746356; x=1719351156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0F2GFRylmsUf8qCCMvo7ZfErHvVg5KnaNyTwWf+ackU=;
        b=mvJl+x8VThzMSjsZToFU0hPLGcdW+SaLGI5jtskoNMlftpc3iBSh6z4sKL+tRZWqXQ
         n90NblUuJ87qd/ZiwdbgDBjrSxcIQA15ZY5knuJVzUnsdnbE0lpKGHmFOkgZiL8JcYO8
         R6fz79Tc+ImhOXxds37NWmdSE9zOjEHTHMYII2nMFTFhc6ZWewjwuGagWeVPixukvrtQ
         XWrXebBnLCK1WKhkW8ESzuWFIQP/cqpQewLbytoj5t05gP2YyHz+r2RsmzHCFQCZ9v5a
         6kJncCN3/eWFhlI9zaoQYzJhKcqNMyYBxXcfJ33oKoqu4J8GMI86zCcPH3gRWzmpOsDX
         2iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718746356; x=1719351156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0F2GFRylmsUf8qCCMvo7ZfErHvVg5KnaNyTwWf+ackU=;
        b=JYBpxznsoqLIN/dtW0DX7DUKzJGakZaRc5z0XGf94qfO8KZDLfXkFTgNhDaN9kxVM+
         D5DbJrEvWrp89ssYQ1lCAXddsiwomRvXni3hIeSedc/9JqH50JILSNoUxRV4ncdcOmnQ
         TIhNMhJ9FK4VZQ8yyfReuGQ4EwJhkhz/uNbh7Q7tHSr/wcy7sAehJbqD9gE+f4LqaO8/
         F8v+5uW1Vca7npJ00Hsj3viJPLBg/axgvTjzlmoqnoT7ugJBsqddvC0+y1Fcb2bW2HmR
         2o0VHw9MlI+YUAgt261SLOl7B/YLgj0EsOzxPBQvZUywP3TpqUZ4ierVXo8jsla2LglQ
         jGVw==
X-Forwarded-Encrypted: i=1; AJvYcCXP96gjoovsojmfldXK5zOgD68reUf5zqsFKrDYIhKtosXg0neV1qR8nOhCbDj26IwCcAKU/SNuwdLebtAajJ0ayPSXqAVK01R8qzXueBXu
X-Gm-Message-State: AOJu0YytG+NVnq95A9YgqCR+WOS6LDcxKMgak/K59ivJ7UaMTNxi4hl+
	hO6MLgPH2JGnBT0TqI3SLnJQPxZPkjf1ouj+s2wlICTaRw8qG7zaU42Nr3wSLkoZ+SHLg18fk6y
	S5f9v/ss9Zl76jaVq3CGmdAJgK/w=
X-Google-Smtp-Source: AGHT+IFIYnRfv9OexIBisPO8GJODl0YW0GErnOlBNhmoJ+53el0v0LQ+XytbXr/0FiI9zYwRjX6PFplolAaJccvUk80=
X-Received: by 2002:a17:90b:344f:b0:2c2:faf7:67a0 with SMTP id
 98e67ed59e1d1-2c7b5c725a6mr924947a91.16.1718746356201; Tue, 18 Jun 2024
 14:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-v1-1-a6d40617dc9b@kernel.org>
 <58253c2e-25a2-48c6-bcd4-5bc3bbe03296@amd.com>
In-Reply-To: <58253c2e-25a2-48c6-bcd4-5bc3bbe03296@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jun 2024 17:32:24 -0400
Message-ID: <CADnq5_Ox_Ak9XedYNPchxMh-AKuLRG1_V8YqpiEB=ke8130B5A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Disable CONFIG_DRM_AMD_DC_FP for RISC-V
 with clang
To: Harry Wentland <harry.wentland@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_143237_427389_A4A9C216 
X-CRM114-Status: GOOD (  30.62  )
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

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgSnVuIDE4LCAyMDI0IGF0IDEwOjE34oCv
QU0gSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+IHdyb3RlOgo+Cj4KPgo+
IE9uIDIwMjQtMDYtMTQgMTU6NTQsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+ID4gQ29tbWl0
IDc3YWNjNmI1NWFlNCAoInJpc2N2OiBhZGQgc3VwcG9ydCBmb3Iga2VybmVsLW1vZGUgRlBVIikg
YW5kCj4gPiBjb21taXQgYTI4ZTRiNjcyZjA0ICgiZHJtL2FtZC9kaXNwbGF5OiB1c2UgQVJDSF9I
QVNfS0VSTkVMX0ZQVV9TVVBQT1JUIikKPiA+IGVuYWJsZWQgc3VwcG9ydCBmb3IgQ09ORklHX0RS
TV9BTURfRENfRlAgd2l0aCBSSVNDLVYuIFVuZm9ydHVuYXRlbHksCj4gPiB0aGlzIGV4cG9zZWQg
LVdmcmFtZS1sYXJnZXItdGhhbiB3YXJuaW5ncyAod2hpY2ggYmVjb21lIGZhdGFsIHdpdGgKPiA+
IENPTkZJR19XRVJST1I9eSkgd2hlbiBidWlsZGluZyBBUkNIPXJpc2N2IGFsbG1vZGNvbmZpZyB3
aXRoIGNsYW5nOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9kbWwvZGNuMzIvZGlzcGxheV9tb2RlX3ZiYV8zMi5jOjU4OjEzOiBlcnJvcjogc3RhY2sg
ZnJhbWUgc2l6ZSAoMjQ0OCkgZXhjZWVkcyBsaW1pdCAoMjA0OCkgaW4gJ0RJU1BDTEtEUFBDTEtE
Q0ZDTEtEZWVwU2xlZXBQcmVmZXRjaFBhcmFtZXRlcnNXYXRlcm1hcmtzQW5kUGVyZm9ybWFuY2VD
YWxjdWxhdGlvbicgWy1XZXJyb3IsLVdmcmFtZS1sYXJnZXItdGhhbl0KPiA+ICAgICAgNTggfCBz
dGF0aWMgdm9pZCBESVNQQ0xLRFBQQ0xLRENGQ0xLRGVlcFNsZWVwUHJlZmV0Y2hQYXJhbWV0ZXJz
V2F0ZXJtYXJrc0FuZFBlcmZvcm1hbmNlQ2FsY3VsYXRpb24oCj4gPiAgICAgICAgIHwgICAgICAg
ICAgICAgXgo+ID4gICAxIGVycm9yIGdlbmVyYXRlZC4KPiA+Cj4gPiBNYW55IGZ1bmN0aW9ucyBp
biB0aGlzIGZpbGUgdXNlIGEgbGFyZ2UgbnVtYmVyIG9mIHBhcmFtZXRlcnMsIHdoaWNoIG11c3QK
PiA+IGJlIHBhc3NlZCBvbiB0aGUgc3RhY2sgYXQgYSBjZXJ0YWluIHBvaW50ZXIgZHVlIHRvIHJl
Z2lzdGVyIGV4aGF1c3Rpb24sCj4gPiB3aGljaCBjYW4gY2F1c2UgaGlnaCBzdGFjayB1c2FnZSB3
aGVuIGlubGluaW5nIGFuZCBpc3N1ZXMgd2l0aCBzdGFjawo+ID4gc2xvdCBhbmFseXNpcyBnZXQg
aW52b2x2ZWQuIFdoaWxlIHRoZSBjb21waWxlciBjYW4gYW5kIHNob3VsZCBkbyBiZXR0ZXIKPiA+
IChhcyBHQ0MgdXNlcyBsZXNzIHRoYW4gaGFsZiB0aGUgYW1vdW50IG9mIHN0YWNrIHNwYWNlIGZv
ciB0aGUgc2FtZQo+ID4gZnVuY3Rpb24pLCBpdCBpcyBub3QgYXMgc2ltcGxlIGFzIGEgZml4IGFz
IGFkanVzdGluZyB0aGUgZnVuY3Rpb25zIG5vdAo+ID4gdG8gdGFrZSBhIGxhcmdlIG51bWJlciBv
ZiBwYXJhbWV0ZXJzLgo+ID4KPiA+IFVuZm9ydHVuYXRlbHksIG1vZGlmeWluZyB0aGVzZSBmaWxl
cyB0byBhdm9pZCB0aGUgcHJvYmxlbSBpcyBhIGRpZmZpY3VsdAo+ID4gdG8ganVzdGlmeSBhcHBy
b2FjaCBiZWNhdXNlIGFueSByZXZpc2lvbnMgdG8gdGhlIGZpbGVzIGluIHRoZSBrZXJuZWwKPiA+
IHRyZWUgbmV2ZXIgbWFrZSBpdCBiYWNrIHRvIHRoZSBvcmlnaW5hbCBzb3VyY2UgKHNvIGNvcGll
cyBvZiB0aGUgY29kZQo+ID4gZm9yIG5ld2VyIGhhcmR3YXJlIHJldmlzaW9ucyBqdXN0IHJlaW50
cm9kdWNlIHRoZSBpc3N1ZSkgYW5kIHRoZSBmaWxlcwo+ID4gYXJlIGhhcmQgdG8gcmVhZC9tb2Rp
ZnkgZHVlIHRvIGJlaW5nICJnY2MtcGFyc2FibGUgSFcgZ29zcGVsLCBjb21pbmcKPiA+IHN0cmFp
Z2h0IGZyb20gSFcgZW5naW5lZXJzIi4KPiA+Cj4gPiBBdm9pZCBidWlsZGluZyB0aGUgcHJvYmxl
bWF0aWMgY29kZSBmb3IgUklTQy1WIGJ5IG1vZGlmeWluZyB0aGUgZXhpc3RpbmcKPiA+IGNvbmRp
dGlvbiBmb3IgYXJtNjQgdGhhdCBleGlzdHMgZm9yIHRoZSBzYW1lIHJlYXNvbi4gRmFjdG9yIG91
dCB0aGUKPiA+IGxvZ2ljYWwgbm90IHRvIG1ha2UgdGhlIGNvbmRpdGlvbiBhIGxpdHRsZSBtb3Jl
IHJlYWRhYmxlIG5hdHVyYWxseS4KPiA+Cj4gPiBGaXhlczogYTI4ZTRiNjcyZjA0ICgiZHJtL2Ft
ZC9kaXNwbGF5OiB1c2UgQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JUIikKPiA+IFJlcG9ydGVk
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+IENsb3NlczogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvMjAyNDA1MzAxNDU3NDEuNzUwNi0yLXBhbG1lckByaXZvc2lu
Yy5jb20vCj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5l
bC5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZyB8
IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L0tjb25maWcg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZwo+ID4gaW5kZXggNWZjZDRmNzc4
ZGMzLi40N2I4YjQ5ZGE4YTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L0tjb25m
aWcKPiA+IEBAIC04LDcgKzgsNyBAQCBjb25maWcgRFJNX0FNRF9EQwo+ID4gICAgICAgZGVwZW5k
cyBvbiBCUk9LRU4gfHwgIUNDX0lTX0NMQU5HIHx8IEFSTTY0IHx8IFJJU0NWIHx8IFNQQVJDNjQg
fHwgWDg2XzY0Cj4gPiAgICAgICBzZWxlY3QgU05EX0hEQV9DT01QT05FTlQgaWYgU05EX0hEQV9D
T1JFCj4gPiAgICAgICAjICFDQ19JU19DTEFORzogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVp
bHRMaW51eC9saW51eC9pc3N1ZXMvMTc1Mgo+ID4gLSAgICAgc2VsZWN0IERSTV9BTURfRENfRlAg
aWYgQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JUICYmICghQVJNNjQgfHwgIUNDX0lTX0NMQU5H
KQo+ID4gKyAgICAgc2VsZWN0IERSTV9BTURfRENfRlAgaWYgQVJDSF9IQVNfS0VSTkVMX0ZQVV9T
VVBQT1JUICYmICEoQ0NfSVNfQ0xBTkcgJiYgKEFSTTY0IHx8IFJJU0NWKSkKPgo+IFRoYW5rcyBm
b3IgYWxzbyBtYWtpbmcgdGhlIGxvZ2ljIGVhc2llciB0byBwYXJzZS4KPgo+IFJldmlld2VkLWJ5
OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPgo+IEhhcnJ5Cj4KPiA+
ICAgICAgIGhlbHAKPiA+ICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRv
IHVzZSB0aGUgbmV3IGRpc3BsYXkgZW5naW5lCj4gPiAgICAgICAgIHN1cHBvcnQgZm9yIEFNREdQ
VS4gVGhpcyBhZGRzIHJlcXVpcmVkIHN1cHBvcnQgZm9yIFZlZ2EgYW5kCj4gPgo+ID4gLS0tCj4g
PiBiYXNlLWNvbW1pdDogYzZjNGRkNTQwMTI1NTFjY2U1Y2RlNDA4YjM1NDY4ZjJjNjJiMGNjZQo+
ID4gY2hhbmdlLWlkOiAyMDI0MDYxNC1hbWRncHUtZGlzYWJsZS1kcm0tYW1kLWRjLWZwLXJpc2N2
LWNsYW5nLTMxYzg0ZjZiOTkwZAo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
