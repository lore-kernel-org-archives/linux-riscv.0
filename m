Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFE1CD4F24
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 20:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpOBUMym3NhRJGGlU4UjsDu+yeVninov1YrG7NnHiEI=; b=jqAWecOO528+ZA
	Rc0FLjD7wmoUspd0pKeCHvL3LPCfvghkIf8kIbIJsTHcsbk8+qnU0fJ4aLImYXeRyQczjm4Sjxk+Y
	zPEP5KOKdw+7ks9ghA7+Mn4LxZVc/ndev5HQVoh9j8o+7HcFREYgzncWtoAu2xpAS6HUWFumLnQIs
	8gvNZNvx1vGTBn86nkL6XyamvQrIpM4OTw3GdJcS+bNfJSoqL7xJ7SrjIDhhVgDT7EEZaSqO7TcVB
	sYuKIhdUWIjvBKfhLCMMX3xQsMvWde32uVWAMYNlnbEKhUneIU1W8JkcmaiNrj3Abaj83I9vgO3Gj
	e9eUljr372I0fw/kUILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwHV-00000005vAm-1cjW;
	Wed, 04 Sep 2024 20:07:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwHR-00000005v8x-1bmN
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 20:07:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2d8abac30ddso3206075a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725480424; x=1726085224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PL5zY783QL6X5SPFrBarOo4DnXUeqnKK/ReHZ/2FTPE=;
        b=JNM0vcYtaeq0088jcaJZ0syaMS84CWM3xiD4BX6y44rPO0cy+49xt5D8IxRO9LsMEv
         tYBJ5BuFQZX01SrF+9BHGkYIwu/FEI9u7pZQmc6inrbriJG2D8Hd5jj3y08tMWi4GHKW
         3aClAFrkTmsOttW4RbkqiTC6roxtpww0kGp8eRvy9S++hffv1WzjP98WY+70AcmamoMY
         wnEim60MH20VNH2tBeak11PbqfPQ4leDgoWyEQmuUSsuhzEzDnqQAX2Ymay+GDakln3B
         Vn3TvRPWoAy9RijEXLnAhU4sQJhDeslD27uQy0nmzQ4uLXWTTgCXOn5F+am2drry5GYb
         xkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725480424; x=1726085224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL5zY783QL6X5SPFrBarOo4DnXUeqnKK/ReHZ/2FTPE=;
        b=MAk6SsTPbjtAHvg1Ro8bdsrt2sf3+X+viqftjOCnW1QysP57buWjsgjaC/eDBwNCeK
         YY1GvKBE2V6Qtb9eixLMSdhd5rW9nyfZSUnfC02Vabnfbx6sd1Od8jdGwOfmOUzYIT4P
         qLXXVyHCLoGJKktpbifrWnvCpM8gf/9wGO1Z5FLYs+Z/05NArlhloD4XYM/hBWF7wXDI
         6/8NYGUupfXEVTuHE8r2yg5u8VDyRb7BuHpqKslmT4C8M8M8/zzVosjAUNv28+Q2/rry
         ZbWzboK0HWJBnojb1y5hQmtHM6Mys8UF56md3uBnEonwXc5a63lY4bO8AkgGMAzBup53
         kJCg==
X-Forwarded-Encrypted: i=1; AJvYcCW1yUqsybCKMxdPsELdxZ2S1UVh3U0Wk0F/e69JYUSWoayvubGBzHsh/dktp2uBtuVSYD5mrDKY0hKYMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx47Sp8U6Fu58jdkXsDpK0ryAVEd+MfJgwqgI1kaop+VJhYTkA
	arkLBlvFSdr8AC7pLhGljFHSTiY91HgmhZCvVZzIL09fMB+sjuZg936tG3oh9PDr4ifiwaXi8mA
	zpkFgNXr6Lv4JnbCV1eDCQe+t3d0=
X-Google-Smtp-Source: AGHT+IHtKAjwXpinnH/tZqcUVI5V2F9+JpSGQtocw+PFEoWrofm1Hdvs5NukodR/4HCKVW1RwKcnqKJY07uQSatTYXY=
X-Received: by 2002:a17:90a:df0f:b0:2d8:8681:44ba with SMTP id
 98e67ed59e1d1-2da62fdd953mr7557029a91.15.1725480424326; Wed, 04 Sep 2024
 13:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
 <20240831041934.1629216-3-pulehui@huaweicloud.com> <2379c139-6457-49dc-84fa-0d60ce226f2a@huaweicloud.com>
 <79b30c83-ee5e-453d-981e-61f826cf82d7@huaweicloud.com>
In-Reply-To: <79b30c83-ee5e-453d-981e-61f826cf82d7@huaweicloud.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Sep 2024 13:06:51 -0700
Message-ID: <CAEf4BzZ4M5GK6_hopdL-8k+=-g975LoY71r6_YKdj-PxXthaMg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/4] libbpf: Access first syscall argument
 with CO-RE direct read on arm64
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_130705_451797_C8F0A3AF 
X-CRM114-Status: GOOD (  20.85  )
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

T24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgMTI6NTfigK9BTSBYdSBLdW9oYWkgPHh1a3VvaGFpQGh1
YXdlaWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBPbiA4LzMxLzIwMjQgMzoyNiBQTSwgWHUgS3VvaGFp
IHdyb3RlOgo+ID4gT24gOC8zMS8yMDI0IDEyOjE5IFBNLCBQdSBMZWh1aSB3cm90ZToKPiA+PiBG
cm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+ID4+Cj4gPj4gQ3VycmVudGx5IFBU
X1JFR1NfUEFSTTEgU1lTQ0FMTCh4KSBpcyBjb25zaXN0ZW50IHdpdGggUFRfUkVHU19QQVJNMV9D
T1JFCj4gPj4gU1lTQ0FMTCh4KSwgd2hpY2ggd2lsbCBpbnRyb2R1Y2UgdGhlIG92ZXJoZWFkIG9m
IEJQRl9DT1JFX1JFQUQoKSwgdGFraW5nCj4gPj4gaW50byBhY2NvdW50IHRoZSByZWFkIHB0X3Jl
Z3MgY29tZXMgZGlyZWN0bHkgZnJvbSB0aGUgY29udGV4dCwgbGV0J3MgdXNlCj4gPj4gQ08tUkUg
ZGlyZWN0IHJlYWQgdG8gYWNjZXNzIHRoZSBmaXJzdCBzeXN0ZW0gY2FsbCBhcmd1bWVudC4KPiA+
Pgo+ID4+IFN1Z2dlc3RlZC1ieTogQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9yZz4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+ID4+IC0t
LQo+ID4+ICAgdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oIHwgNCArKy0tCj4gPj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaCBiL3Rvb2xzL2xpYi9icGYvYnBm
X3RyYWNpbmcuaAo+ID4+IGluZGV4IGU3ZDkzODJlZmViMy4uMDUxYzQwOGU2YWVkIDEwMDY0NAo+
ID4+IC0tLSBhL3Rvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaAo+ID4+ICsrKyBiL3Rvb2xzL2xp
Yi9icGYvYnBmX3RyYWNpbmcuaAo+ID4+IEBAIC0yMjIsNyArMjIyLDcgQEAgc3RydWN0IHB0X3Jl
Z3NfX19zMzkwIHsKPiA+PiAgIHN0cnVjdCBwdF9yZWdzX19fYXJtNjQgewo+ID4+ICAgICAgIHVu
c2lnbmVkIGxvbmcgb3JpZ194MDsKPiA+PiAtfTsKPiA+PiArfSBfX2F0dHJpYnV0ZV9fKChwcmVz
ZXJ2ZV9hY2Nlc3NfaW5kZXgpKTsKPiA+PiAgIC8qIGFybTY0IHByb3ZpZGVzIHN0cnVjdCB1c2Vy
X3B0X3JlZ3MgaW5zdGVhZCBvZiBzdHJ1Y3QgcHRfcmVncyB0byB1c2Vyc3BhY2UgKi8KPiA+PiAg
ICNkZWZpbmUgX19QVF9SRUdTX0NBU1QoeCkgKChjb25zdCBzdHJ1Y3QgdXNlcl9wdF9yZWdzICop
KHgpKQo+ID4+IEBAIC0yNDEsNyArMjQxLDcgQEAgc3RydWN0IHB0X3JlZ3NfX19hcm02NCB7Cj4g
Pj4gICAjZGVmaW5lIF9fUFRfUEFSTTRfU1lTQ0FMTF9SRUcgX19QVF9QQVJNNF9SRUcKPiA+PiAg
ICNkZWZpbmUgX19QVF9QQVJNNV9TWVNDQUxMX1JFRyBfX1BUX1BBUk01X1JFRwo+ID4+ICAgI2Rl
ZmluZSBfX1BUX1BBUk02X1NZU0NBTExfUkVHIF9fUFRfUEFSTTZfUkVHCj4gPj4gLSNkZWZpbmUg
UFRfUkVHU19QQVJNMV9TWVNDQUxMKHgpIFBUX1JFR1NfUEFSTTFfQ09SRV9TWVNDQUxMKHgpCj4g
Pj4gKyNkZWZpbmUgUFRfUkVHU19QQVJNMV9TWVNDQUxMKHgpICgoKGNvbnN0IHN0cnVjdCBwdF9y
ZWdzX19fYXJtNjQgKikoeCkpLT5vcmlnX3gwKQo+ID4+ICAgI2RlZmluZSBQVF9SRUdTX1BBUk0x
X0NPUkVfU1lTQ0FMTCh4KSBcCj4gPj4gICAgICAgQlBGX0NPUkVfUkVBRCgoY29uc3Qgc3RydWN0
IHB0X3JlZ3NfX19hcm02NCAqKSh4KSwgX19QVF9QQVJNMV9TWVNDQUxMX1JFRykKPiA+Cj4gPiBD
b29sIQo+ID4KPiA+IEFja2VkLWJ5OiBYdSBLdW9oYWkgPHh1a3VvaGFpQGh1YXdlaS5jb20+Cj4g
Pgo+ID4KPgo+IFdhaXQsIGl0IGJyZWFrcyB0aGUgZm9sbG93aW5nIHRlc3Q6Cj4KCllvdSBtZWFu
LCAqaWYgeW91IGNoYW5nZSB0aGUgZXhpc3RpbmcgdGVzdCBsaWtlIGJlbG93KiwgaXQgd2lsbCBi
cmVhaywKcmlnaHQ/IEFuZCB0aGF0J3MgZXhwZWN0ZWQsIGJlY2F1c2UgYXJtNjQgaGFzCkFSQ0hf
SEFTX1NZU0NBTExfV1JBUFBFUiwgd2hpY2ggbWVhbnMgc3lzY2FsbCBwdF9yZWdzIGFyZSBhY3R1
YWxseSBub3QKdGhlIGtwcm9iZSdzIGN0eCwgc28geW91IGNhbid0IGRpcmVjdGx5IGFjY2VzcyBp
dC4gV2hpY2ggaXMgd2h5IHdlCmhhdmUgUFRfUkVHU19QQVJNMV9DT1JFX1NZU0NBTEwoKSB2YXJp
YW50cy4KClNlZSBob3cgQlBGX0tTWVNDQUxMIG1hY3JvIGlzIGltcGxlbWVudGVkLCB0aGVyZSBh
cmUgdHdvIGNhc2VzOgpfX19icGZfc3lzd2FwX2FyZ3MoKSwgd2hpY2ggdXNlcyBCUEZfQ09SRV9S
RUFEKCktYmFzZWQgbWFjcm9zIHRvIGZldGNoCmFyZ3VtZW50cywgYW5kIF9fX2JwZl9zeXNjYWxs
X2FyZ3MoKSB3aGljaCB1c2VzIGRpcmVjdCBjdHggcmVhZHMuCgoKPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvYnBmX3N5c2NhbGxfbWFjcm8uYwo+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9icGZfc3lzY2FsbF9tYWNyby5jCj4gQEAgLTQz
LDcgKzQzLDcgQEAgaW50IEJQRl9LUFJPQkUoaGFuZGxlX3N5c19wcmN0bCkKPgo+ICAgICAgICAg
IC8qIHRlc3QgZm9yIFBUX1JFR1NfUEFSTSAqLwo+Cj4gLSAgICAgICBicGZfcHJvYmVfcmVhZF9r
ZXJuZWwoJnRtcCwgc2l6ZW9mKHRtcCksICZQVF9SRUdTX1BBUk0xX1NZU0NBTEwocmVhbF9yZWdz
KSk7Cj4gKyAgICAgICB0bXAgPSBQVF9SRUdTX1BBUk0xX1NZU0NBTEwocmVhbF9yZWdzKTsKPiAg
ICAgICAgICBhcmcxID0gdG1wOwo+ICAgICAgICAgIGJwZl9wcm9iZV9yZWFkX2tlcm5lbCgmYXJn
Miwgc2l6ZW9mKGFyZzIpLCAmUFRfUkVHU19QQVJNMl9TWVNDQUxMKHJlYWxfcmVncykpOwo+ICAg
ICAgICAgIGJwZl9wcm9iZV9yZWFkX2tlcm5lbCgmYXJnMywgc2l6ZW9mKGFyZzMpLCAmUFRfUkVH
U19QQVJNM19TWVNDQUxMKHJlYWxfcmVncykpOwo+Cj4gRmFpbGVkIHdpdGggdmVyaWZpZXIgcmVq
ZWN0aW9uOgo+Cj4gMDogUjE9Y3R4KCkgUjEwPWZwMAo+IDsgaW50IEJQRl9LUFJPQkUoaGFuZGxl
X3N5c19wcmN0bCkgQCBicGZfc3lzY2FsbF9tYWNyby5jOjMzCj4gMDogKGJmKSByNiA9IHIxICAg
ICAgICAgICAgICAgICAgICAgICA7IFIxPWN0eCgpIFI2X3c9Y3R4KCkKPiA7IHBpZF90IHBpZCA9
IGJwZl9nZXRfY3VycmVudF9waWRfdGdpZCgpID4+IDMyOyBAIGJwZl9zeXNjYWxsX21hY3JvLmM6
MzYKPiAxOiAoODUpIGNhbGwgYnBmX2dldF9jdXJyZW50X3BpZF90Z2lkIzE0ICAgICAgOyBSMF93
PXNjYWxhcigpCj4gOyBpZiAocGlkICE9IGZpbHRlcl9waWQpIEAgYnBmX3N5c2NhbGxfbWFjcm8u
YzozOQo+IDI6ICgxOCkgcjEgPSAweGZmZmY4MDAwODJlMGUwMDAgICAgICAgOyBSMV93PW1hcF92
YWx1ZShtYXA9YnBmX3N5c2Mucm9kYXRhLGtzPTQsdnM9NCkKPiA0OiAoNjEpIHIxID0gKih1MzIg
KikocjEgKzApICAgICAgICAgIDsgUjFfdz02MDcKPiA7IHBpZF90IHBpZCA9IGJwZl9nZXRfY3Vy
cmVudF9waWRfdGdpZCgpID4+IDMyOyBAIGJwZl9zeXNjYWxsX21hY3JvLmM6MzYKPiA1OiAoNzcp
IHIwID4+PSAzMiAgICAgICAgICAgICAgICAgICAgIDsgUjBfdz1zY2FsYXIoc21pbj0wLHNtYXg9
dW1heD0weGZmZmZmZmZmLHZhcl9vZmY9KDB4MDsgMHhmZmZmZmZmZikpCj4gOyBpZiAocGlkICE9
IGZpbHRlcl9waWQpIEAgYnBmX3N5c2NhbGxfbWFjcm8uYzozOQo+IDY6ICg1ZSkgaWYgdzEgIT0g
dzAgZ290byBwYys5OCAgICAgICAgOyBSMF93PTYwNyBSMV93PTYwNwo+IDsgcmVhbF9yZWdzID0g
UFRfUkVHU19TWVNDQUxMX1JFR1MoY3R4KTsgQCBicGZfc3lzY2FsbF9tYWNyby5jOjQyCj4gNzog
KDc5KSByOCA9ICoodTY0ICopKHI2ICswKSAgICAgICAgICA7IFI2X3c9Y3R4KCkgUjhfdz1zY2Fs
YXIoKQo+IDsgdG1wID0gUFRfUkVHU19QQVJNMV9TWVNDQUxMKHJlYWxfcmVncyk7IEAgYnBmX3N5
c2NhbGxfbWFjcm8uYzo0Ngo+IDg6ICg3OSkgcjEgPSAqKHU2NCAqKShyOCArMjcyKQo+IFI4IGlu
dmFsaWQgbWVtIGFjY2VzcyAnc2NhbGFyJwo+IHByb2Nlc3NlZCA4IGluc25zIChsaW1pdCAxMDAw
MDAwKSBtYXhfc3RhdGVzX3Blcl9pbnNuIDAgdG90YWxfc3RhdGVzIDAgcGVha19zdGF0ZXMgMCBt
YXJrX3JlYWQgMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
