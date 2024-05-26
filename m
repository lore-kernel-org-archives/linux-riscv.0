Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A89C25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 26 May 2024 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNH3XWPkwaV+K2V8neIi30uY3DrIBgNKej6PqSteZxw=; b=x8hpxU1phEqAKY
	EnniLCD8GZaW4Hlaust00N+yN4Jt/q9DBFTDY5PhL6sZaGNc5DXGqt54HcwwZSchntV6/PMff0d+8
	QYIRLSbBD6SdvKcLUURFwGujQ9LHWZhjstCx9OLCZbUiE8hYWTYXQG2VLkhH9sfhgRC6fE9tcbZBw
	NeInzj+0lzvIMdhgv9wVuHXSPbwIjmjjpuFDPN2+YdRQXXFOYzwzXiacfz74Q/DLZdL6kU0hDVdgs
	qk5IxU41nGL23FVVFnJWYNbV79EzJ8oc7XHFWif13o8KKBA/9CXszLgbDRrsx8mHBtmRnvUBTmzSQ
	uXAwXEYJpVzFN2jmJCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBA0t-0000000CPfT-3bTy;
	Sun, 26 May 2024 09:17:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBA0q-0000000CPf0-36Rh
	for linux-riscv@lists.infradead.org;
	Sun, 26 May 2024 09:17:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52965199234so2473915e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716715074; x=1717319874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goyX40MpO9c6U+QncCsJjuNFHpMKeUPXDPypSlJzumE=;
        b=cAusaQJo7EhTV4zHT/N+l8MnwubvDbkNlvAnMK3u97T3Jbp7lSqqbhEmS1tCEUvpft
         QBdF82n1qoyjVc48g85FQ/VM7qA5LqDNoQb8erq6whFuxm3vBxccoOI2RQiLt6zENj3J
         1GaoOdC1nGWIZjJasbs/xYfRvjR2fK0aYDxPMzs/3nWdm/4oLK4be06pEKJ2wOvZEDt2
         hPuacrzdQlXcJeelY7T+0qYbSeFsISFX/RIdZVI7gQgOB5902LURauSCYGW3HoXnItJo
         xwFfmiLlRUPqWzK/3DFYl0GyaYj338I3g6C9PmbS7yQl5bmrwO7KEf3wMgYcrMirz6LU
         67aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716715074; x=1717319874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goyX40MpO9c6U+QncCsJjuNFHpMKeUPXDPypSlJzumE=;
        b=I3wyGxpQJ2fTgVpF7YmLGJYJLl8m/KZX0sNOWrSoHacBmWyfRBC/DzOm5Vk1+dW7xl
         eOQ8DX9tdsHpmbiWGCufvfVcT017rv455ca+a4WgPFadWzShuIT+0rKSIXMFRGaOHDER
         d0Ma67isyhskD5XbwWBYAvLc3qiwokcM0kbf/ZC9RaVhfKPhbO4/uZZoGBU6F5Ya9BMH
         WJHc0Z3QT8z1oJZpsB523ADjamhieih4egkudeq2vxFMwk5aNusmYp69MZ8EFj2nTv7U
         VLsobjsXHHrP9TeP5fZzkbX0uXhMXNQC36iJ205BszzVsYNwsa8+sReZs54uXmcXgXCN
         2eHw==
X-Forwarded-Encrypted: i=1; AJvYcCX1e+nn5H1ecwcqrbEpmfSOweVRXxjz9HE/dCBEGocEZ5NUjDTp0KpNCjoK9gpIiFoQlf0L8sct4Wqdnydsq6QoUxJO4o15OgzTG+Z3ImFL
X-Gm-Message-State: AOJu0YxsVRfgcA62BoPbSXGLlWbaRqaIjCxpDWHmlcYmc1b6rGz5lyQh
	1HJHj7pgQGK5pblw5nbSD+SoOJAhNVu2ETCSHOzoIuQikBH4UDQbedbF2LSXS4Wzr9c5xvk9sDm
	l8/atYcUsr/9yoEiS4yoMreztOic=
X-Google-Smtp-Source: AGHT+IHP85Brq+zt9olJsBLOeg9dcYitYeyb2WMPISwr4bI9K1IleEX3PFCqN4Rigizc63Rp2MbOeUGgS4+9gFhaROk=
X-Received: by 2002:ac2:43b7:0:b0:51f:b781:72a7 with SMTP id
 2adb3069b0e04-52966ab5947mr4122035e87.60.1716715073409; Sun, 26 May 2024
 02:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240318020916.1299190-1-haibo1.xu@intel.com> <7d69fac0-4cd1-4db6-b19f-fb5a418549ab@rivosinc.com>
 <CAJve8omCXANwhQuvFnhzw_=Fx0fh1pHq+7UYMWS507-2cHVx9A@mail.gmail.com>
In-Reply-To: <CAJve8omCXANwhQuvFnhzw_=Fx0fh1pHq+7UYMWS507-2cHVx9A@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 26 May 2024 17:17:40 +0800
Message-ID: <CAJve8onakqwyXNcwtNOLTGah+=pbWzdNBwM64U0htyDJyY3nwQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
To: Atish Patra <atishp@rivosinc.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	ardb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_021756_808242_50FCAA89 
X-CRM114-Status: GOOD (  34.64  )
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

a2luZGx5IHBpbmchCgpBbnkgbW9yZSBjb21tZW50cyBvbiB0aGlzIHBhdGNoPwoKVGhhbmtzLApI
YWlibwoKT24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMTA6MjLigK9QTSBIYWlibyBYdSA8eGlhb2Jv
NTV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBAUGFsbWVyLAo+Cj4gQ291bGQgeW91IHBsZWFz
ZSBsZXQgbWUga25vdyB3aGV0aGVyIHRoaXMgcGF0Y2ggd2FzIE9LIGZvciB0aGUgbmV4dCBSSVND
LVYgUFVMTD8KPgo+IFRoYW5rcywKPiBIYWlibwo+Cj4gT24gV2VkLCBNYXIgMjAsIDIwMjQgYXQg
Mzo0NuKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiAzLzE3LzI0IDE5OjA5LCBIYWlibyBYdSB3cm90ZToKPiA+ID4gRW5hYmxlIHRoZSBkbWkg
ZHJpdmVyIGZvciByaXNjdiB3aGljaCB3b3VsZCBhbGxvdyBhY2Nlc3MgdGhlCj4gPiA+IFNNQklP
UyBpbmZvIHRocm91Z2ggc29tZSB1c2Vyc3BhY2UgZmlsZSgvc3lzL2Zpcm13YXJlL2RtaS8qKS4K
PiA+ID4KPiA+ID4gVGhlIGNoYW5nZSB3YXMgYmFzZWQgb24gdGhhdCBvZiBhcm02NCBhbmQgaGFz
IGJlZW4gdmVyaWZpZWQKPiA+ID4gYnkgZG1pZGVjb2RlIHRvb2wuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4g
Q2hhbmdlcyBzaW5jZSB2MQo+ID4gPiAgICAtIENoYW5nZSB0byB1c2UgbWVtcmVtYXAvbWVtdW5t
YXAgZm9yIGRtaV8oZWFybHkpX3JlbWFwL3VubWFwCj4gPiA+ICAgICAgZGVmaW5pdGlvbihzdWdn
ZXN0ZWQgYnkgQXJkKQo+ID4gPiAgICAtIE1pbm9yIGNsZWFuIHVwIGZvciBjb21tZW50cyAoQXJk
KQo+ID4gPiAtLS0KPiA+ID4gICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
fCAxMSArKysrKysrKysrKwo+ID4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZG1pLmggICAg
ICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgIGRyaXZlcnMvZmlybXdh
cmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYyB8IDEzICsrKysrKysrKysrKysKPiA+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9kbWkuaAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+IGluZGV4IDhlYmFmZTMzN2Vh
Yy4uMzYzOTE1MWNiNGVmIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+
ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+IEBAIC05NTIsNiArOTUyLDE3IEBAIGNv
bmZpZyBFRkkKPiA+ID4gICAgICAgICBhbGxvdyB0aGUga2VybmVsIHRvIGJlIGJvb3RlZCBhcyBh
biBFRkkgYXBwbGljYXRpb24uIFRoaXMKPiA+ID4gICAgICAgICBpcyBvbmx5IHVzZWZ1bCBvbiBz
eXN0ZW1zIHRoYXQgaGF2ZSBVRUZJIGZpcm13YXJlLgo+ID4gPgo+ID4gPiArY29uZmlnIERNSQo+
ID4gPiArICAgICBib29sICJFbmFibGUgc3VwcG9ydCBmb3IgU01CSU9TIChETUkpIHRhYmxlcyIK
PiA+ID4gKyAgICAgZGVwZW5kcyBvbiBFRkkKPiA+ID4gKyAgICAgZGVmYXVsdCB5Cj4gPiA+ICsg
ICAgIGhlbHAKPiA+ID4gKyAgICAgICBUaGlzIGVuYWJsZXMgU01CSU9TL0RNSSBmZWF0dXJlIGZv
ciBzeXN0ZW1zLgo+ID4gPiArCj4gPiA+ICsgICAgICAgVGhpcyBvcHRpb24gaXMgb25seSB1c2Vm
dWwgb24gc3lzdGVtcyB0aGF0IGhhdmUgVUVGSSBmaXJtd2FyZS4KPiA+ID4gKyAgICAgICBIb3dl
dmVyLCBldmVuIHdpdGggdGhpcyBvcHRpb24sIHRoZSByZXN1bHRhbnQga2VybmVsIHNob3VsZAo+
ID4gPiArICAgICAgIGNvbnRpbnVlIHRvIGJvb3Qgb24gZXhpc3Rpbmcgbm9uLVVFRkkgcGxhdGZv
cm1zLgo+ID4gPiArCj4gPiA+ICAgY29uZmlnIENDX0hBVkVfU1RBQ0tQUk9URUNUT1JfVExTCj4g
PiA+ICAgICAgIGRlZl9ib29sICQoY2Mtb3B0aW9uLC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkPXRs
cyAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1yZWc9dHAgLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQt
b2Zmc2V0PTApCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2RtaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWkuaAo+ID4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNhN2NjZTU1N2VmNwo+ID4gPiAtLS0g
L2Rldi9udWxsCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZG1pLmgKPiA+ID4g
QEAgLTAsMCArMSwyNCBAQAo+ID4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAgKi8KPiA+ID4gKy8qCj4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgSW50ZWwgQ29ycG9y
YXRpb24KPiA+ID4gKyAqCj4gPiA+ICsgKiBiYXNlZCBvbiBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2RtaS5oCj4gPiA+ICsgKgo+ID4gPiArICogVGhpcyBmaWxlIGlzIHN1YmplY3QgdG8gdGhlIHRl
cm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPiA+ID4gKyAqIExp
Y2Vuc2UuICBTZWUgdGhlIGZpbGUgIkNPUFlJTkciIGluIHRoZSBtYWluIGRpcmVjdG9yeSBvZiB0
aGlzIGFyY2hpdmUKPiA+ID4gKyAqIGZvciBtb3JlIGRldGFpbHMuCj4gPiA+ICsgKi8KPiA+ID4g
Kwo+ID4gPiArI2lmbmRlZiBfX0FTTV9ETUlfSAo+ID4gPiArI2RlZmluZSBfX0FTTV9ETUlfSAo+
ID4gPiArCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+Cj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgZG1pX2Vhcmx5X3JlbWFwKHgsIGwpICAg
ICAgICAgICAgICAgIG1lbXJlbWFwKHgsIGwsIE1FTVJFTUFQX1dCKQo+ID4gPiArI2RlZmluZSBk
bWlfZWFybHlfdW5tYXAoeCwgbCkgICAgICAgICAgICAgICAgbWVtdW5tYXAoeCkKPiA+ID4gKyNk
ZWZpbmUgZG1pX3JlbWFwKHgsIGwpICAgICAgICAgICAgICAgICAgICAgIG1lbXJlbWFwKHgsIGws
IE1FTVJFTUFQX1dCKQo+ID4gPiArI2RlZmluZSBkbWlfdW5tYXAoeCkgICAgICAgICAgICAgICAg
IG1lbXVubWFwKHgpCj4gPiA+ICsjZGVmaW5lIGRtaV9hbGxvYyhsKSAgICAgICAgICAgICAgICAg
a3phbGxvYyhsLCBHRlBfS0VSTkVMKQo+ID4gPiArCj4gPiA+ICsjZW5kaWYKPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYyBiL2RyaXZlcnMvZmly
bXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYwo+ID4gPiBpbmRleCAwOTUyNWZiNWMyNDAuLmMzYmZi
OWU3N2UwMiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvcmlzY3YtcnVu
dGltZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYwo+
ID4gPiBAQCAtMTUyLDMgKzE1MiwxNiBAQCB2b2lkIGFyY2hfZWZpX2NhbGxfdmlydF90ZWFyZG93
bih2b2lkKQo+ID4gPiAgIHsKPiA+ID4gICAgICAgZWZpX3ZpcnRtYXBfdW5sb2FkKCk7Cj4gPiA+
ICAgfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCByaXNjdl9kbWlfaW5pdCh2b2lk
KQo+ID4gPiArewo+ID4gPiArICAgICAvKgo+ID4gPiArICAgICAgKiBPbiByaXNjdiwgRE1JIGRl
cGVuZHMgb24gVUVGSSwgYW5kIGRtaV9zZXR1cCgpIG5lZWRzIHRvCj4gPiA+ICsgICAgICAqIGJl
IGNhbGxlZCBlYXJseSBiZWNhdXNlIGRtaV9pZF9pbml0KCksIHdoaWNoIGlzIGFuIGFyY2hfaW5p
dGNhbGwKPiA+ID4gKyAgICAgICogaXRzZWxmLCBkZXBlbmRzIG9uIGRtaV9zY2FuX21hY2hpbmUo
KSBoYXZpbmcgYmVlbiBjYWxsZWQgYWxyZWFkeS4KPiA+ID4gKyAgICAgICovCj4gPiA+ICsgICAg
IGRtaV9zZXR1cCgpOwo+ID4gPiArCj4gPiA+ICsgICAgIHJldHVybiAwOwo+ID4gPiArfQo+ID4g
PiArY29yZV9pbml0Y2FsbChyaXNjdl9kbWlfaW5pdCk7Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEF0
aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
