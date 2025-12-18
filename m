Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B11D6E2B7
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 22:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5114gEi0pQ5hlEa3UhnO2aVGSTRcnVplG5o0WcI6Uuc=; b=Ffj6w5ayr6tLIJ
	j+fpalbqbV6jEAcxyrThQkDITrM5zYUQC8YliIrV1qhKWvlng9XqFWjqoxfLXZQcDyAKBX3vD7Jzx
	tsARRcRbRyU3R5MG6kAEziSBjv497jzhCBjLFHCHegwGIInPLmHPA+4w9ThWJdwXQxyQU3StCdP4o
	tQUffJmt/+b2uIaG9QXmwf5N+xOPKaJnQ+KxY8d0HyG3vBR0j+omz0KC4ZxbLeeri9E5jb4eKTFfX
	gTva7u/KJ/cvd/SaloOk0O+B3x+n8jwgKWHyH42jaF4n+xT2Bw9MKP52nRAWM7/RnRlIZrHeV7xbY
	bL/XeX9MA2koSZd47Vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMj9-00000009HHt-3JFB;
	Thu, 18 Dec 2025 22:44:07 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMj7-00000009HHW-1Zrd
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 22:44:06 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6446fcddf2fso1082301d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 14:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766097844; x=1766702644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNtkMphr11RONSM4Q0l7F/V0bPE7UA2WWJNfv0nmNOE=;
        b=UCD8hut9kovolMrpFiWOLXwihmbBJMaeAPaFxkLZjhd1Rk5yO9UpCZO0MdBTQAGxC7
         bnpT+iA48C140WVKovOyJqKhr/8Rz6jW19bnBnclRXDX1t3zRWOKhCP/SYbWm4LCelp5
         1Vp3eq69wsdTPbwT33oiL0V2yVEzOGBkN4NG8dlVfSrSjcGqAr0I5HaBKzfPUtfUy29I
         I6+E7ythsuJInrXHFb+0coovIePmloYYTfs08rYDIpuyOU61TAwYcHUfDH+hxH5FHKP7
         uHusdi+2eQrvuowJVl6vEENJGrlbmogF1/8UMva9HQbwmooa8XozoHs9Q7yQLfxvICCH
         i7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766097844; x=1766702644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tNtkMphr11RONSM4Q0l7F/V0bPE7UA2WWJNfv0nmNOE=;
        b=UI6CjevONfpCHMPR1jHlcAZFu9Oo4Rob1Dl7G/HR5cVv4HFQVP4h69vt0qxdvMEbxT
         qb170hlJ+fTLG9JXQ9jNoQq2EoKgjVuPRiwEQA/sJ3/pgHYRNOW4Oc8L57rb+RXJNoxy
         SfV0/1/TI+tCDkGAD87Ke3wWb8fnYzxdfeHOmxVaKw/v+9wbU4TXj6ykIgZfAsI0LscU
         +5Q4YR2B1Qu7/xBBm5QEKxSRdETROJJ192G8QF0/XSnPqxjZLAtL5IhlU5FIsL46JIf7
         rcK1t6okdTOMDHX68qdvO/INc/7b+0gEm5In8/qFKjfHNX7R+fzVHXVllUIMEDxKos4z
         Gxww==
X-Forwarded-Encrypted: i=1; AJvYcCUEbs7azumrzRW12p7e+EJJL5z6bkq2tRh2Fr9eGhInIs/URKUt5ch33XnYz2s16V7kyzK/pyD2qNTMDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZHKBTqxLbBVymR4JLx1DQgCHMF/eqsYE0v7zSUhT5I5x/3+x
	559hncKexGNyRJN/3IkxZH7wXRMpln79daYOvd/BzpH7LS+j5c4bu/rXHIQLD8e0RBZnhifSljx
	GV+tEIRWZP5i71ltMCLyuGbig4pBlkc9SbRwm5uET6A==
X-Gm-Gg: AY/fxX4vYCmZ0fw7Ur/iKp0BTsQ5y5SkpDqb2/8mWfAYo47bYuAVrX+/3ae/ofCvY02
	4BW8mVicg7wGhi0ZT6r6RktAtpGguy2j31XNYlL7ZLQKOKI8ykMtYSstSGr0C/ZBWtgBQeIZtYc
	PE3woxl/uUxpCtpK15YxJThiZVZwqyiUd7aYDqtL9KRsWs3MpQDx1yQqYOfVVFDyGt2pCtdrXjm
	t1zcWL1W5jWb+ddlgDan3FMxhpgSlh4LDzT809zBxXwTwI1QTA6ulIBaWIsWsvxTTKceUnNbKZK
	szcgsb52KCoMTE4O4Ml48PitvXNPzcjfeCqpMLFCtP+p
X-Google-Smtp-Source: AGHT+IHr9hpj9uqrYP2d59hszb1BUZgIk82NvUf6gFEhieUb4Vo2pOoa14pKSV9rG9cinvTKc1D+k5JkFPZo7lCJHqE=
X-Received: by 2002:a05:690e:1a07:b0:63f:a103:5d57 with SMTP id
 956f58d0204a3-6466a8398e7mr669772d50.5.1766097843665; Thu, 18 Dec 2025
 14:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com> <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
 <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com> <e5d92ecd-6bc1-438d-87ec-96f60d1b8a24@gmail.com>
In-Reply-To: <e5d92ecd-6bc1-438d-87ec-96f60d1b8a24@gmail.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 19 Dec 2025 06:43:52 +0800
X-Gm-Features: AQt7F2oVki_LCRnJdnjikkWlgQNyCWYw-P2aQmvWCPvKClL0oukF3aD3rXDC9xw
Message-ID: <CAH1PCMaRrw1zu41oKpBO+5DpDU2Ri69TQEQa+4tXkZJtEuQDHw@mail.gmail.com>
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Bo Gan <ganboing@gmail.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_144405_547833_6CEDBC53 
X-CRM114-Status: GOOD (  33.39  )
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

SGksIEJvCgpPbiBXZWQsIERlYyAxNywgMjAyNSBhdCA1OjA24oCvUE0gQm8gR2FuIDxnYW5ib2lu
Z0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgR3VvZG9uZywKPgo+IE9uIDEyLzE2LzI1IDIzOjEz
LCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTA6MzPigK9Q
TSBIZWlucmljaCBTY2h1Y2hhcmR0Cj4gPiA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwu
Y29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDEyLzE2LzI1IDE0OjMyLCBHdW9kb25nIFh1IHdyb3Rl
Ogo+ID4+PiBLMyBQaWNvLUlUWCBpcyBhIDIuNS1pbmNoIHNpbmdsZS1ib2FyZCBjb21wdXRlciBl
cXVpcHRlZCB3aXRoIGEgU3BhY2VtaVQKPiA+Pj4gSzMgU29DLgo+ID4+Pgo+ID4+PiBUaGlzIG1p
bmltYWwgZGV2aWNlIHRyZWUgZW5hYmxlcyBib290aW5nIGludG8gYSBzZXJpYWwgY29uc29sZSB3
aXRoIFVBUlQKPiA+Pj4gb3V0cHV0Lgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25n
IFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvTWFrZWZpbGUgICAgICAgIHwgIDEgKwo+ID4+PiAgICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLXBpY28taXR4LmR0cyB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4g
Pj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2Vm
aWxlIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZQo+ID4+PiBpbmRleCA5
NTg4OWU3MjY5ZDFiYWU2NzliMjhjZDA1M2UxYjBhMjNhZTZkZTY4Li43ZTJiODc3MDI1NzE4MTEz
YTBlMzE5MTdlYWRmNzU2MmY0ODhkODI1IDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvTWFrZWZpbGUKPiA+Pj4gQEAgLTQsMyArNCw0IEBAIGR0Yi0kKENPTkZJR19BUkNI
X1NQQUNFTUlUKSArPSBrMS1taWxrdi1qdXBpdGVyLmR0Ygo+ID4+PiAgICBkdGItJChDT05GSUdf
QVJDSF9TUEFDRU1JVCkgKz0gazEtbXVzZXBpLXByby5kdGIKPiA+Pj4gICAgZHRiLSQoQ09ORklH
X0FSQ0hfU1BBQ0VNSVQpICs9IGsxLW9yYW5nZXBpLXIycy5kdGIKPiA+Pj4gICAgZHRiLSQoQ09O
RklHX0FSQ0hfU1BBQ0VNSVQpICs9IGsxLW9yYW5nZXBpLXJ2Mi5kdGIKPiA+Pj4gK2R0Yi0kKENP
TkZJR19BUkNIX1NQQUNFTUlUKSArPSBrMy1waWNvLWl0eC5kdGIKPiA+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtcGljby1pdHguZHRzIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMy1waWNvLWl0eC5kdHMKPiA+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MC4uMGY5ZDA0ZGQzNTJmNTMzMWU4MjU5OTI4NTExM2I4NmFmNWIwOWViZQo+ID4+PiAtLS0gL2Rl
di9udWxsCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtcGljby1p
dHguZHRzCj4gPj4+IEBAIC0wLDAgKzEsMjUgQEAKPiA+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4gPj4+ICsvKgo+ID4+PiArICogQ29weXJpZ2h0IChj
KSAyMDI1IFNwYWNlbWlUIChIYW5nemhvdSkgVGVjaG5vbG9neSBDby4gTHRkCj4gPj4+ICsgKiBD
b3B5cmlnaHQgKGMpIDIwMjUgR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPj4+
ICsgKi8KPiA+Pj4gKwo+ID4+PiArI2luY2x1ZGUgImszLmR0c2kiCj4gPj4+ICsKPiA+Pj4gKy8g
ewo+ID4+PiArICAgICBtb2RlbCA9ICJTcGFjZW1pVCBLMyBQaWNvLUlUWCI7Cj4gPj4+ICsgICAg
IGNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtcGljby1pdHgiLCAic3BhY2VtaXQsazMiOwo+ID4+
PiArCj4gPj4+ICsgICAgIGNob3NlbiB7Cj4gPj4+ICsgICAgICAgICAgICAgc3Rkb3V0LXBhdGgg
PSAic2VyaWFsMCI7Cj4gPj4+ICsgICAgIH07Cj4gPj4+ICsKPiA+Pj4gKyAgICAgbWVtb3J5QDEw
MDIwMDAwMCB7Cj4gPj4+ICsgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiA+
Pj4gKyAgICAgICAgICAgICByZWcgPSA8MHgxIDB4MDAyMDAwMDAgMHgzIDB4ZmZlMDAwMDA+Owo+
ID4+Cj4gPj4gU2hvdWxkbid0IHRoZSByZXNlcnZlZCBtZW1vcnkgYmUgZGVzY3JpYmVkIGFzIG5v
LW1hcCAvcmVzZXJ2ZWQtbWVtb3J5Cj4gPj4gbm9kZXMgaW5zdGVhZD8KPiA+Cj4gPiBIaSBIZWlu
cmljaCwKPiA+Cj4gPiBZZXMsIHlvdSBhcmUgcmlnaHQuIFVzaW5nIGEgcmVzZXJ2ZWQtbWVtb3J5
IG5vZGUgd2l0aCB0aGUgbm8tbWFwIHByb3BlcnR5IGlzCj4gPiB0aGUgY29ycmVjdCBhcHByb2Fj
aC4gSSB3aWxsIHVwZGF0ZSB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24gdG8gZXhwbGljaXRseQo+
ID4gcmVzZXJ2ZSB0aGUgZmlyc3QgMk1CLgo+ID4KPiA+Pgo+ID4+IEkgd291bGQgYXNzdW1lIHRo
YXQgMHgxLDAwMDAsMDAwMCBpcyB0aGUgbG9jYXRpb24gb2YgT3BlblNCSS4KPiA+PiBXaGF0IGlz
IGF0IDB4MyxmZmUwLDAwMDA/Cj4gPgo+ID4gWWVzLCBjb25maXJtZWQsIDB4MTAwMDAwMDAwIGlz
IHRoZSBzdGFydCBvZiBPcGVuU0JJLiBUaGUgc2l6ZSAweDNmZmUwMDAwMCBpbgo+ID4gbXkgb3Jp
Z2luYWwgcGF0Y2ggd2FzIHRoZSByZXN1bHQgb2YgbWFudWFsbHkgc3VidHJhY3RpbmcgdGhlIDJN
QiBPcGVuU0JJCj4gPiBvZmZzZXQgZnJvbSB0aGUgdG90YWwgMTZHQiBtZW1vcnkuCj4gPgo+ID4g
SSB3aWxsIGNvcnJlY3QgdGhpcyBpbiB2MiB0byBzaG93IHRoZSBhY3R1YWwgbWVtb3J5IGFuZCBw
dXQgdGhlIGZpcnN0IDJNQiBpbgo+ID4gcmVzZXJ2ZWQtbWVtb3J5IHt9IGZvciBvcGVuc2JpLgo+
Cj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHRoZSByaWdodCBhcHByb2FjaC4gVGhlIExpbnV4IGtl
cm5lbCBzaG91bGRuJ3QgY2FyZQo+IGFib3V0IHRoZSBzaXplIG9mIHRoZSB1bmRlcmx5aW5nIFNC
SSBpbXBsZW1lbnRhdGlvbi4gVGhlIHNpemUgb2YgT3BlblNCSQo+IGFsc28gZGVwZW5kcyBvbiB0
aGUgdmVyc2lvbiBhbmQgZmVhdHVyZXMgZW5hYmxlZC4gVGh1cywgeW91IHNob3VsZCBqdXN0CgpU
aGFua3MgZm9yIHRoZSByZXZpZXcuIFlvdSBhcmUgY29ycmVjdCBhbmQgSSBjb25maXJtZWQgd2l0
aCB0aGUgVS1Cb290CndoaWNoIHdlIGFyZSBjdXJyZW50bHkgdXNpbmcgb24gdGhlIEszIFBpY28g
Ym9hcmQgY2FuIGhhbmRsZSB0aGlzIG1lbW9yeQpyZXNlcnZhdGlvbiBzaXR1YXRpb24uIEFuZCBp
dCBzaG91bGQsIGFzIHlvdSBzYWlkLiBVLUJvb3QKaGFzIGZpcnN0LWhhbmQgaW5mb3JtYXRpb24g
YWJvdXQgd2hlcmUgYW5kIHdoYXQgaXQgd2FudHMgdG8gcmVzZXJ2ZS4KCj4gbGV0IHRoZSBPcGVu
U0JJIG9yIHdoYXRldmVyIFNCSSBmaXggdXAgdGhlIGRldmljZS10cmVlIGZvciB5b3UuIE9wZW5T
QkkKPiBhbHJlYWR5IGRvZXMgdGhhdCB0b2RheS4gSXQgaW5zZXJ0cyBvbmUgb3IgbW9yZSByZXNl
cnZlZC1tZW1vcnkgbm9kZSBhbmQKPiBjYXJ2ZXMgb3V0IHRoZSBtZW1vcnkgcmVnaW9uIG9mIGl0
cyBvd24uIElmIHRoZXJlJ3Mgc29tZSBib290bG9hZGVyIGluCj4gYmV0d2VlbiBTQkkgPC0+IExp
bnV4LCBzdWNoIGFzIFUtYm9vdCwgdGhlbiBpdCdzIHJlc3BvbnNpYmxlIGZvciBjb3B5aW5nCj4g
b3ZlciB0aG9zZSByZXNlcnZlZCByZWdpb25zIGZyb20gT3BlblNCSSBpbnRvIHRoZSBkZXZpY2Ut
dHJlZSBMaW51eCB1c2VzCj4gKFUtYm9vdCBhbHJlYWR5IGRvZXMpLiBUaHVzLCB0aGVyZSdzIG5v
IG5lZWQgdG8gbWFudWFsbHkgc3BlY2lmeSBpdC4KCkFncmVlLiBCYWNrIHRvIHRoZSBLMyBQaWNv
IERUUywgbmV4dCB2ZXJzaW9uLCBJIHdpbGwgZGVzY3JpYmUgbWVtb3J5IGxheW91dAphcyB3aGF0
IGl0IGlzIG9uIHRoZSBib2FyZC4KbWVtb3J5QDEwMDAwMDAwMCAjIHN0YXJ0cyBmcm9tIDRHCgpC
UiwKR3VvZG9uZyBYdQoKPgo+IEJvCj4KPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuCj4g
Pgo+ID4gQlIsCj4gPiBHdW9kb25nIFh1Cj4gPgo+ID4KPiA+Pgo+ID4+IEJlc3QgcmVnYXJkcwo+
ID4+Cj4gPj4gSGVpbnJpY2gKPiA+Pgo+ID4+PiArICAgICB9Owo+ID4+PiArfTsKPiA+Pj4gKwo+
ID4+PiArJnVhcnQwIHsKPiA+Pj4gKyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4+PiArfTsKPiA+
Pj4KPiA+Pgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
