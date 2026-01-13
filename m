Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D2BCF45D4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 02:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvE06pzazrhSqy5c85l1usWlv856/DTvckBgEJkuuWE=; b=OlirGATRU22hh5
	U2r09XsGle/37N1BDIofJWGyQ52JycqArHrSwOM0wR9cYWsar3rilCx4xDJvzhRuk/GsYzixefCz1
	YMqLoN/odTD9H9ubcECdbiUNe3lDY49iD0EDOgTxM6HLaae4UOVWH97jZNBhCfUHpfgojBXpg6oN8
	iRYwRBJC7JNkP/mpqim9jKhbNKcBvysvfPSReVXGV5I9yxusnvAjTd9mMFi3e4xVmj9RlHloEV/7+
	/61gtpZxw8gWjdJKQm+GlrfWdr+iW2Iwyp/sB0dLibATOdGRhg9VDdP1FT3zksaNiORxuERvYyGyI
	IDaMiSpeXQfoDfXmPzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUOl-00000006S4O-2rTM;
	Tue, 13 Jan 2026 02:44:47 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUOi-00000006S3u-2O3H
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 02:44:45 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-78e6dc6d6d7so32993887b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 18:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768272283; x=1768877083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXpazA6SgKTW1vhNzpqG3QrGSTso7uVz9zzI2iC/vyg=;
        b=n13Pg+9/2p2whlzQfo8jM8pgy8pm0bp0P8WCj4mUnW0nqCrTedx3yJsnYkH1uaggoK
         lGuqUf+YaKEt6QqKnCw9LWkkfBMcNT2B9L0cFl7kTBPtgJn/WRSh8cc1HDvUpJGWfeTC
         rTH69lX6aNmKufjgCsLLikBqqKjTfFyvSL7Hzmr8IJVYw5kDPguJbTPdGq15mWnXIfk7
         k7AehdX+7xZSmJ+7z2yuJS2OkoaskuWY3+x4xjpIaYyhDznoh2Bi2g5mo3Tl741TTiP5
         Qjwi9+UNPZe+D+yT3Is4vBcvghTSEtHuR+J7PNv8uzC6Slj1fd7SfUH1KChis1ZYfOpp
         owyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768272283; x=1768877083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AXpazA6SgKTW1vhNzpqG3QrGSTso7uVz9zzI2iC/vyg=;
        b=YkYSb51IdLXwa52+4qZSZYZSPwfJXYyq65DAwY6uWmm+t+2ltPllp7at/yRHhcwm+n
         yi3UXNRW7NjKJwLW5ar2aq/VzwP0BmS/d9dg270lz0DQDnd57eqlC8ozjURJ7taausVc
         jmxhFA5uaJkvIdrvNuxBmWBS7m83datBh12lMJrRKiLwffxQWec0eRtHnbJxGouyIcuT
         jCnc800Ty9YPP3+ekq2vPfTXClCStsy8l3XDJoGRhJTqULP84nIcn1XPWxTgfmFWvoKk
         SVORGuePLMhYkcwj/TaLcY09OnhnBdEzkY1HkHHIqVttJw9qCh2wwgYvLT4sOAR0Wd2o
         nAXg==
X-Forwarded-Encrypted: i=1; AJvYcCXF+vf1NZInoFJq3a6wAuFLkWg43KbI/V7ATvbqCvyCW451sInKpSs1pudj2BmDh38jlAVwHO09H4oCBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7HoJ4hWS3QOwAxnV1ppnAe48MF68A8RNVzkAl3CGJoFalXzcH
	x9k4kaBAwCvVi6+tPj4Fi5Lkma4p+pXqagJqzCjsV0RdQ2Qpz2LzOhtZtGVs3te3gqECoT5IGkd
	zAddp92NnO75cXtIjl/LVhC6Bqm2N04LfBZZaNxPtww==
X-Gm-Gg: AY/fxX5M1/X6JVgeWd767bClJJ0fDHKb/D+qy4p+f97OeA5nu2lsy56RAY8Zq3pfzG4
	KU43pyH/v2U6mg7FRNiskpR9b11TFDJrT5Rgl62Yqc20wNs+m5ujoLpTJi0Sodysv3zWtDGy/f9
	b7Is/l380UZH+aILa9dpr0jMaT7isHBp0vnN1At6w0AL5kCwXC4NwnRDe3s+49x4S2uhA/lHAbM
	U6Pklg4lsKkfBUElvjxEi1KG/o9PskoRyCX3Umni4RYPVnxmHWJLvSkJBcliO8r6KGL1vllcMZI
	vm9GiVah6DQPpeKxpX9bKO1XkHBlsxS3qF/7BQ==
X-Google-Smtp-Source: AGHT+IHj3ypPU/NNMfpdHkNAGLFnFzOTMM7fMEliuRPTtrZJWbtlqHPi8+SGGYOwkosOTrtDx//q+fuT7Iu+SWMNFCA=
X-Received: by 2002:a05:690e:14c7:b0:641:f5bc:6991 with SMTP id
 956f58d0204a3-64716c6e1admr15279346d50.77.1768272283353; Mon, 12 Jan 2026
 18:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-6-d492f3a30ffa@riscstar.com> <20260112-veal-retaliate-7cf9a2981aaf@spud>
In-Reply-To: <20260112-veal-retaliate-7cf9a2981aaf@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 10:44:31 +0800
X-Gm-Features: AZwV_Qgw5WUVzIip-0vximPTfFaT5zWrcbo35d-VZT71kic6QgdIU7i9b69aOEs
Message-ID: <CAH1PCMYgGVm1uJMjoxVkOMvPeRLsvybi7PW9k3sWyj3ij8c4Vg@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] dt-bindings: riscv: Add B ISA extension description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_184444_862549_83E32140 
X-CRM114-Status: GOOD (  18.82  )
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

SGksIENvbm9yCgpPbiBUdWUsIEphbiAxMywgMjAyNiBhdCA1OjQx4oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDEwLCAyMDI2IGF0IDAx
OjE4OjE4UE0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBBZGQgZGVzY3JpcHRpb24gb2Yg
dGhlIHNpbmdsZS1sZXR0ZXIgQiBleHRlbnNpb24gZm9yIEJpdCBNYW5pcHVsYXRpb24uCj4gPiBC
IGlzIG1hbmRhdG9yeSBmb3IgUlZBMjNVNjQuCj4gPgo+ID4gVGhlIEIgZXh0ZW5zaW9uIGlzIHJh
dGlmaWVkIGluIHRoZSAyMDI0MDQxMSB2ZXJzaW9uIG9mIHRoZSB1bnByaXZpbGVnZWQKPiA+IElT
QSBzcGVjaWZpY2F0aW9uLiBBY2NvcmRpbmcgdG8gdGhlIHJhdGlmaWVkIHNwZWMsIHRoZSBCIHN0
YW5kYXJkCj4gPiBleHRlbnNpb24gY29tcHJpc2VzIGluc3RydWN0aW9ucyBwcm92aWRlZCBieSB0
aGUgWmJhLCBaYmIsIGFuZCBaYnMKPiA+IGV4dGVuc2lvbnMuCj4gPgo+ID4gQWRkIHR3by13YXkg
ZGVwZW5kZW5jeSBjaGVjayB0byBlbmZvcmNlIHRoYXQgQiBpbXBsaWVzIFpiYS9aYmIvWmJzOyBh
bmQKPiA+IHdoZW4gWmJhL1piYi9aYnMgKGFsbCBvZiB0aGVtKSBhcmUgc3BlY2lmaWVkLCB0aGVu
IEIgbXVzdCBiZSBhZGRlZCB0b28uCj4gPgo+ID4gVGhlIHJlYXNvbiB3aHkgQi9aYmEvWmJiL1pi
cyBtdXN0IGNvZXhpc3QgYXQgdGhlIHNhbWUgdGltZSBpcyB0aGF0Cj4gPiB1bmxpa2Ugb3RoZXIg
c2luZ2xlLWxldHRlciBleHRlbnNpb25zLCBCIHdhcyByYXRpZmllZCAoQXByLzIwMjQpIG11Y2gK
PiA+IGxhdGVyIHRoYW4gaXRzIGNvbXBvbmVudCBleHRlbnNpb25zIFpiYS9aYmIvWmJzIChKdW4v
MjAyMSkuCj4gPgo+ID4gV2hlbiAiYiIgaXMgc3BlY2lmaWVkLCB6YmEvemJiL3picyBtdXN0IGJl
IHByZXNlbnQgdG8gZW5zdXJlCj4gPiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3Rp
bmcgc29mdHdhcmUgYW5kIGtlcm5lbHMgdGhhdCBvbmx5Cj4gPiBsb29rIGZvciB0aGUgZXhwbGlj
aXQgY29tcG9uZW50IHN0cmluZ3MuCj4gPgo+ID4gV2hlbiBhbGwgdGhyZWUgY29tcG9uZW50cyB6
YmEvemJiL3picyBhcmUgc3BlY2lmaWVkLCAiYiIgc2hvdWxkIGFsc28gYmUKPiA+IHByZXNlbnQu
IE1ha2luZyAiYiIgbWFuZGF0b3J5IHdoZW4gYWxsIHRocmVlIGNvbXBvbmVudHMgYXJlIHByZXNl
bnQuCj4KPiA+IEV4aXN0aW5nIGRldmljZXRyZWVzIHdpdGggemJhL3piYi96YnMgYnV0IHdpdGhv
dXQgImIiIHdpbGwgZ2VuZXJhdGUKPiA+IHdhcm5pbmdzIHRoYXQgY2FuIGJlIGZpeGVkIGluIGZv
bGxvdy11cCBwYXRjaGVzLgo+Cj4gQXJlIHlvdSBnb2luZyB0byBzZW5kIHRoZXNlIGZpeHVwIHBh
dGNoZXMgZm9yIG90aGVyIGRldmljZXRyZWVzPyBUaGUKPiBtYWpvcml0eSBhcHBlYXIgdG8gYmUg
b3RoZXIgc3BhY2VtaXQgZGV2aWNlcy4KClllcywgSSB3aWxsLiBNeSBjaGVjayBzaG93cyB0aGF0
IHRoZXNlIHRocmVlIGR0c2kgZmlsZXMgbmVlZCB0byBiZSB1cGRhdGVkIHRvCmluY2x1ZGUgdGhl
IG5ld2x5IHJhdGlmaWVkICJiIiBleHRlbnNpb246CgphcmNoL3Jpc2N2L2Jvb3QvZHRzL2FubG9n
aWMvZHIxdjkwLmR0c2kKYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LWNwdXMuZHRz
aQphcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKCkkgd2lsbCBzdGFydCBhIGZv
bGxvdyB1cCBwYXRjaCB0byB1cGRhdGUgdGhlc2UgZHRzaSBmaWxlcy4gQmFzaWNhbGx5LCBhZGRp
bmcKImIiIGludG8gYm90aCB0aGUgInJpc2N2LGlzYS1leHRlbnNpb25zIiBhbmQgInJpc2N2LGlz
YSIgKHdoZW4gYXZhaWxhYmxlKQpmaWVsZHMuCgpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LgoK
QmVzdCByZWdhcmRzLApHdW9kb25nIFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
