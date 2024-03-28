Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE2BCD128A
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 00:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwdjRHaElp7K7Tgp2W4ag7iNS03XcHjDxjqZvusMEFg=; b=kGOti/qPCAIrsW
	JqrQEQKNU+yH7c9nvAIVA5yj5n7KSWUKgkjAMeOGi2r/nBqM9i7kd0fwJqTEbvh53j03FtwKAk6Lu
	v6ckKfooTaLc+UODGnoN8ZN7HtTpopckyBT8njEonFcI21ZsCEPfndIBz5wegW+jwsqljqHX5pxTX
	8exdwfQjtpc5tTKR+o8PXw9tLwkhpEy2tpv9vbrf3r3avUfHYYvFaue+jn3sTLEGsdP2mP3nIQDxY
	lhS8cMAaBri3RFc2tMaF073v3GZJFxhoFMLxJ3vLiVmqkKf4o3A28U4gIwZ8i+LGPVarU3GGBOaNl
	aENqkkFiDM2KMrRdnLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpzxS-0000000GCH4-1MPc;
	Fri, 29 Mar 2024 00:18:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpz0A-0000000G3Yl-104D;
	Thu, 28 Mar 2024 23:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VBPtswbRJVFEjRlZATnnC5PXpnMT+l8bd9tpx27HnBM=; b=jrVZz2qfECQyx6NK6pme8W+NzP
	F1WTCcKkPmxbENl+TxwZHnVyewsb1y9kYb+vwHRGk1uAqzWIdrwaaDE5yJjVgm+7idSSxXCVYhlx3
	w9Z4O3skvx62uHhjfmqw/Ir92rgX3QFfsz6ocLXJJ6zhz/Lrv0Kj1zx+aujG8agPWbCaf5iZeJgjH
	xZ+ZKC33MLrHO6KVZpk5o+KNTFZAfPt1nES6IZTuIzZA9MDW2jtINNgWE86ZdE3X+TpBiAzz0g2c1
	B4FIBTGW+SfZdXDh8uSN7zzHefU+gfrDTqPCfUSg/InH1/CKaKAyzgQCLW3DYOPL7npe3f1/eQQlz
	M1W8QpYg==;
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpz03-00000001ERa-1q06;
	Thu, 28 Mar 2024 23:17:40 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d6dda3adb9so15496641fa.1;
        Thu, 28 Mar 2024 16:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711667851; x=1712272651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBPtswbRJVFEjRlZATnnC5PXpnMT+l8bd9tpx27HnBM=;
        b=hyHDbKSYaI+4PZi+PYnLo/LjmQFsQbnQ2e4fueHugmCCyuxUd0+tLZxP+mf/gK1tui
         doyMW6ScqUQIO93PI8zdbRVyKg6hawO9kkZmthhzMMAUUpd+O+40Ssetyx1JRrclbmjH
         FWfx3HSmpT16MnVovvrQIet4qYufTE/TbESn9QrpP9fsqq8OVvP8oZ+ppkugtO4ZTI+V
         UjcC9uL+lXNWxxvXK0gonDMpvy+oYLlbehqNdQtdECmBSftf+ZHa30ij1DEv6TXMNb94
         +4W5F8i2rWx/Iy1i+z0H71tkch5zTA5AmEosG9j+NelqSScUo5xanjbOHnlqQpWj6psy
         aUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711667851; x=1712272651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBPtswbRJVFEjRlZATnnC5PXpnMT+l8bd9tpx27HnBM=;
        b=Kw1RQSc8bq7TheEmHRyoWzUDnfERLoN6kKaz+dSYJyPM5+MGgwJ5IUw2/Ss8nNmTuI
         5RgU+yGQfnJpWvw7KtvZjZeUFUw1M4PBRI2Ksy7cYO1+7hDOui2JsGZa1sUGT4T41HAz
         tQHJLzTW0wIT6/DicUDStld/7ypqRhvHlb3SnSBqaAYhBUxO22NBrzeLXqUR2i3S+wo+
         BA0RqqpN2GmyGPZGRjds5ulRclG6h71Br14t5S4sdq26Eg9uzsljCw8isY/ASkAHiTp6
         eyDtKQY9N7GRC6IW/QyMaMq0DIJGc28lCzbM29IFk7Ez4jQwxjgHtTWvh+sHqej9sx0s
         gqoA==
X-Forwarded-Encrypted: i=1; AJvYcCVCT2qj6yJAhVYGvEOSFq2LAdEyeQtYddLmP9zyohTfT+29rIZVh0jenWlg0DmMTKbbhc5EVh6FXN/pFS4hRNsTUUrRoSQlfdDDPnOEGJZSlGxodmoSflzYF/8dN6//q6Ta/751Kz32hWg67FJ63WNsMvuUPvc=
X-Gm-Message-State: AOJu0Yw5XMVXZREeQWKTsm+vv40sNamBYLzJIVDzHkBDG9pEetgLVU1W
	T22on1fPJ6R7pYWxwZOFPvRA9lMKYGLsRl/nTCFhS/A9FXOStfy6o6PMwXItBHguIVWCMoj5N47
	NwrF71L+x1n3O+2vzah+nBowRosQ=
X-Google-Smtp-Source: AGHT+IG5xIH2Dr8kwrbaPKFwGkwQN2RxPioeS2J7HN42D01hRwbUDEoBKIDHKJKBLqNdT3QFt8lsl8OnqZLOHWZb5Wo=
X-Received: by 2002:a05:651c:1692:b0:2d6:c7b5:989c with SMTP id
 bd18-20020a05651c169200b002d6c7b5989cmr378385ljb.28.1711667850565; Thu, 28
 Mar 2024 16:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com> <20240328111330.194dcbe5@gandalf.local.home>
In-Reply-To: <20240328111330.194dcbe5@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 28 Mar 2024 16:17:19 -0700
Message-ID: <CAADnVQKsuV2OhT4rc+k=WDmVMQxbjDiC4+zNbre2Kpj1hod5xw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: Steven Rostedt <rostedt@goodmis.org>
Cc: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>, 
	Jiri Olsa <jolsa@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Quentin Monnet <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_231738_099874_661D5343 
X-CRM114-Status: GOOD (  29.12  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgODoxMOKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMjggTWFyIDIwMjQgMjI6NDM6NDYgKzA4
MDAKPiDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4g
PiBJIGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAo+ID4gdHJh
bXBvbGluZXMuIEl0IGlzIHNsb3csIHF1aXRlIHNsb3csIHdoaWNoIGNvbnN1bWUgdXAgdG8KPiA+
IDYwcy4gV2UgY2FuJ3QgZG8gaXQgdGhpcyB3YXkuCj4gPgo+ID4gTm93LCBJIGhhdmUgYSBiYWQg
aWRlYS4gSG93IGFib3V0IHdlIGludHJvZHVjZQo+ID4gYSAiZHluYW1pYyB0cmFtcG9saW5lIj8g
VGhlIGJhc2ljIGxvZ2ljIG9mIGl0IGNhbiBiZToKPiA+Cj4gPiAiIiIKPiA+IHNhdmUgcmVncwo+
ID4gYnBmcyA9IHRyYW1wb2xpbmVfbG9va3VwX2lwKGlwKQo+ID4gZmVudHJ5ID0gYnBmcy0+ZmVu
dHJpZXMKPiA+IHdoaWxlIGZlbnRyeToKPiA+ICAgZmVudHJ5KGN0eCkKPiA+ICAgZmVudHJ5ID0g
ZmVudHJ5LT5uZXh0Cj4gPgo+ID4gY2FsbCBvcmlnaW4KPiA+IHNhdmUgcmV0dXJuIHZhbHVlCj4g
Pgo+ID4gZmV4aXQgPSBicGZzLT5mZXhpdHMKPiA+IHdoaWxlIGZleGl0Ogo+ID4gICBmZXhpdChj
dHgpCj4gPiAgIGZleGl0ID0gZmV4aXQtPm5leHQKPiA+Cj4gPiB4eHh4eHgKPiA+ICIiIgo+ID4K
PiA+IEFuZCB3ZSBsb29rdXAgdGhlICJicGZzIiBieSB0aGUgZnVuY3Rpb24gaXAgaW4gYSBoYXNo
IG1hcAo+ID4gaW4gdHJhbXBvbGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoK
PiA+Cj4gPiBzdHJ1Y3QgYnBmX2FycmF5IHsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpmZW50cmll
czsKPiA+ICBzdHJ1Y3QgYnBmX3Byb2cgKmZleGl0czsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpt
b2RpZnlfcmV0dXJuczsKPiA+IH0KPiA+Cj4gPiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHRoZSBi
cGYgcHJvZ0EgdG8gZnVuY3Rpb24gQS9CL0MsCj4gPiB3ZSBvbmx5IG5lZWQgdG8gY3JlYXRlIHRo
ZSBicGZfYXJyYXlBLCBicGZfYXJyYXlCLCBicGZfYXJyYXlDCj4gPiBhbmQgYWRkIHRoZSBwcm9n
QSB0byB0aGVtLCBhbmQgaW5zZXJ0IHRoZW0gdG8gdGhlIGhhc2ggbWFwCj4gPiAiZGlyZWN0X2Nh
bGxfYnBmcyIsIGFuZCBhdHRhY2ggdGhlICJkeW5hbWljIHRyYW1wb2xpbmUiIHRvCj4gPiBBL0Iv
Qy4gSWYgYnBmX2FycmF5QSBleGlzdCwganVzdCBhZGQgcHJvZ0EgdG8gdGhlIHRhaWwgb2YKPiA+
IGJwZl9hcnJheUEtPmZlbnRyaWVzLiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHByb2dCIHRvCj4g
PiBCL0MsIGp1c3QgYWRkIHByb2dCIHRvIGJwZl9hcnJheUItPmZlbnRyaWVzIGFuZAo+ID4gYnBm
X2FycmF5Qi0+ZmVudHJpZXMuCj4gPgo+ID4gQ29tcGFyZWQgdG8gdGhlIHRyYW1wb2xpbmUsIGV4
dHJhIG92ZXJoZWFkIGlzIGludHJvZHVjZWQKPiA+IGJ5IHRoZSBoYXNoIGxvb2t1cGluZy4KPiA+
Cj4gPiBJIGhhdmUgbm90IGJlZ3VuIHRvIGNvZGUgeWV0LCBhbmQgSSBhbSBub3Qgc3VyZSB0aGUg
b3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGUuIENvbnNpZGVyaW5nIHRoYXQgd2UgYWxzbyBuZWVk
IHRvIGRvIGhhc2ggbG9va3VwCj4gPiBieSB0aGUgZnVuY3Rpb24gaW4ga3Byb2JlX211bHRpLCBt
YXliZSB0aGUgb3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGU/Cj4KPiBTb3VuZHMgbGlrZSB5b3Ug
YXJlIGp1c3QgcmVjcmVhdGluZyB0aGUgZnVuY3Rpb24gbWFuYWdlbWVudCB0aGF0IGZ0cmFjZQo+
IGhhcy4gSXQgYWxzbyBjYW4gYWRkIHRob3VzYW5kcyBvZiB0cmFtcG9saW5lcyB2ZXJ5IHF1aWNr
bHksIGJlY2F1c2UgaXQgZG9lcwo+IGl0IGluIGJhdGNoZXMuIEl0IHRha2VzIHNwZWNpYWwgc3lu
Y2hyb25pemF0aW9uIHN0ZXBzIHRvIGF0dGFjaCB0byBmZW50cnkuCj4gZnRyYWNlIChhbmQgSSBi
ZWxpZXZlIG11bHRpLWtwcm9iZXMpIHVwZGF0ZXMgYWxsIHRoZSBhdHRhY2htZW50cyBmb3IgZWFj
aAo+IHN0ZXAsIHNvIHRoZSBzeW5jaHJvbml6YXRpb24gbmVlZGVkIGlzIG9ubHkgZG9uZSBvbmNl
Lgo+Cj4gSWYgeW91IHJlYWxseSB3YW50IHRvIGhhdmUgdGhvdXNhbmRzIG9mIGZ1bmN0aW9ucywg
d2h5IG5vdCBqdXN0IHJlZ2lzdGVyIGl0Cj4gd2l0aCBmdHJhY2UgaXRzZWxmLiBJdCB3aWxsIGdp
dmUgeW91IHRoZSBhcmd1bWVudHMgdmlhIHRoZSBmdHJhY2VfcmVncwo+IHN0cnVjdHVyZS4gQ2Fu
J3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPgo+IEl0IHdp
bGwgcHJvYmFibHkgbWFrZSB5b3VyIGFjY291bnRpbmcgbXVjaCBlYXNpZXIsIGFuZCBqdXN0IGxl
dCBmdHJhY2UKPiBoYW5kbGUgdGhlIGZlbnRyeSBsb2dpYy4gVGhhdCdzIHdoYXQgaXQgd2FzIG1h
ZGUgdG8gZG8uCgpBYnNvbHV0ZWx5IGFncmVlLgpUaGVyZSBpcyBubyBwb2ludCByZS1pbnZlbnRp
bmcgdGhpcyBsb2dpYy4KCk1lbmxvbmcsCmJlZm9yZSB5b3UgaG9vayB1cCBpbnRvIGZ0cmFjZSBj
aGVjayB3aGV0aGVyCml0J3MgZ29pbmcgdG8gYmUgYW55IGRpZmZlcmVudCBmcm9tIGtwcm9iZS1t
dWx0aSwKc2luY2UgaXQncyB0aGUgc2FtZSBmdHJhY2UgdW5kZXJuZWF0aC4KSSBzdXNwZWN0IGl0
IHdpbGwgbG9vayBleGFjdGx5IHRoZSBzYW1lLgpTbyBpdCBzb3VuZHMgbGlrZSBtdWx0aS1mZW50
cnkgaWRlYSB3aWxsIGJlIHNoZWx2ZWQgb25jZSBhZ2Fpbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
