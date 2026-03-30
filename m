Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E52F3D60F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWSKxueCTU9+q8rKyTQF5djLXFnHeuy1tpnpixbs7PE=; b=FxZV1wmbRCR7P9
	yurDEza9ZKGc1nVVyYnyWZxvizNQnf1KflT3GEOYIIJumM0XjWPOeZGfF+g7FPpFOicM4nSAzMadI
	s2d443WBzKWUbVNouHorn1s4rmLqIg2EfkfKqSbD9j64hjImC4EwAqnrnLp28qYfDNnt6fXeKcK7h
	4tdkySMidlKdTqAStrRu3ZyuYU+iDK2gAW4Xp0SLvkThX52FSHhpxMtf9NrVW7/pDoLynfCm9CcIt
	Uma2VSZpAxVxMXwKu1wXwEiYyZXjAMPq0YhoKVxFu17D0XBcWW4Wztmy8yM7996bKn596gy+BjZsS
	hrxzpFy22qkmszwItT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xZ-0000000AqwM-0PCi;
	Mon, 30 Mar 2026 08:26:57 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xW-0000000Aqu5-0uZs
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:26:56 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-67c1e0718f1so2605530eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774859213; cv=none;
        d=google.com; s=arc-20240605;
        b=VUa3i7resje2E9gyKBu92vemWDeV0HP4vg1FfxAwc3+6dLBUtR65KN1luBVhG01+c0
         Ia0nlA/5433WpHEteb1qkuHyU1LajjFhofq/CEvpWo1h6+bt0+7O+xihzDTd3+I48wHt
         QwKDOxcs0mz2P9TSfwMa7e1fGOaQixJ8RbQHJ9it5DS04zbQp4/tCrqFUIFayoIFBHK4
         Z1lIf6bxoDbe07XMod6EZ80OTeftKE/1tEZT4LEi2hMdZgVWGjx+J/0kQoZPWJedHSBg
         dDrUwicG069jQHmPxmpE6VEfrkoWSoinzLnfthjJvHkdfAQhxGDMbN/e9V8Pncbf97n4
         Fqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=feNTViC8MFBS6AQiIqWex0bCSJJNY3jWANzumtuP1Dw=;
        fh=9CTtinxS9VZ4stztIAirluEx75vMmIPYQEvDoyKgpDw=;
        b=jc208cCbv/90/82vAWscnChCxciHP/+0jUUc8RjgCodBQnVanj8QdCAf2DaG8Bvms9
         oTP+87XagUs4OIGU1LI1hovKUJF8Ow2v4WUqnTAhhnXJihoQo8oDo7d2nmRmRqlHkkkw
         uWh8PGD/YlDLXZIH+c/dtq0hD/egEBNjtoByJH04g68ZvKuqMoRV0IrZON4x/4fe/STl
         DVOliSEamJbBJvot2M0xPpBwmGbfi7vvamZ2w9lxGb2W6h6may4YAHRLEcs6SnIjb95J
         1qRiLvFku1u923q4WuGN2moIYU38mqgPzoKXBSjUDWX/eyKMLETzdVyKepdRm5LeoBzo
         WKjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774859213; x=1775464013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feNTViC8MFBS6AQiIqWex0bCSJJNY3jWANzumtuP1Dw=;
        b=BrHHh5bDHvz0scQ3IZz71EHJNMakCITmni4wVUbiyvdV3L6Y7y1+sMkUGC3mEtmXTZ
         3d6xBO63ntTKyur9Fv7dGVV8L/a5dqsiPm9YuK6GMvlbpVSOZxRdxEiRX0busqEku7Na
         njvSApGsk/nTWePKsBh7uFkom8oXhaaEsFUN59RNazwgQKmcJl1nc/J5uiM1xzjctnbN
         WvW4qr3Gat+8upqY1XfDWeVM4JAdrJH/DQJfuBXJWx1y+pVXZEW/JgzFBrhdi4SaJMkA
         L6/9V8eg9zJ6RSdl7Y04ilLXflC9rYq1RYN7h5O0RmSYDGl9NBC7l4gtxokG66q0lENR
         XxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859213; x=1775464013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feNTViC8MFBS6AQiIqWex0bCSJJNY3jWANzumtuP1Dw=;
        b=ejYCNJve2EVNN5XN8AWhpIPi+a03OixUyAgsyc5dJg4iTX81OPg1yR6yQtXRhMgh5h
         1hc2e5cPQDrNM+N3ZzrTnX/tM12bQL7C61OLEemRnprpZU70K92QyG/t2dWcra4hzSqF
         2GDpS5wCKqVygSTVy+wSUKG1TBMbkKd57Ll92EdFiRpA+MOaKGVKlTtGJMy3u53sMrul
         m8VSIU9OA2DQLS2aXYl6phcNswEDt50BuExGExOTRt6Fg1wtszpIH+ICcT7GNH3TVTly
         WmgLPWTTD7qUGsCpH/+f7m9Atw3hOoG0DzU2cCPKDxOI3mVYC94spTEcEF1pgTO95MIv
         /iVA==
X-Forwarded-Encrypted: i=1; AJvYcCVRVgVtvb9L3dEQoL9bQg+2LwAKVplcu6auusUM33pqV1HoQal3KWCnAIIpSkeebuKzcNubdhza7c/xdg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3LQu1FBZvdJ7/AEI+9nlVpySIuttqsEVi9xRykheK8+iOWYRw
	aeA61nlQqR9QbI9MR74QLiwVeIJDRbAFFHJaneCa1CSBNCUQgqTAv0hsThWgeakv2dDiMtB9xpC
	JW+NbiD6fw1m2N/6WQHtpyP7l9HKV0tzAe1v4xjftcLr4xcxK+hXs6kg=
X-Gm-Gg: ATEYQzzrndp2rA61WgiC2Fa14Eea+iC16+GVVIrqk9UbX5C3/O8FqbWv/SMCoj0EblI
	Bw7jHTTkX/ZM/BLboue8fi6NYV76UPCUsi733eT19bywbf1ru/+0ak3/PN/fiaSg1SR3mBPXHl6
	R4Cc+Nq+rsVY1ezeB5mY574F8JpyIpXVXgVld56QqzFdN2epubITjyuM0XPLJUNq6r8ZPUOwXOv
	V2tdQz2sg2LEZFjwonWu49HHHg3J1IgQBPhW1aNndzPBPDsqjjchbOOAQrbBl1iSW0V31SD2H5e
	U8VVh4sL/wLXB2GNCKiAZRDetis/LcjEtLyMlZc58gjTLA2a8Ivk6nGMCZeG2WUtmIViDtXFVdx
	J+uBUbII3sitCeOpYHrJ9aCs8gA==
X-Received: by 2002:a05:6820:8188:b0:67c:f1d7:3d50 with SMTP id
 006d021491bc7-67e186566fdmr6317419eaf.32.1774859213091; Mon, 30 Mar 2026
 01:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260319035902.924661-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260319035902.924661-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 13:56:41 +0530
X-Gm-Features: AQROBzD8YcMhVDsongcGEG3uL_G8BwWLXwkEeCGZRFqCzB5qKwscWNn1JiDFjFg
Message-ID: <CAAhSdy0nu1kCYxo2gmpHAgdQKFSUPb36fBoUELE-LLf_BwSO9w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix integer overflow in kvm_pmu_validate_counter_mask()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012654_268002_F3CDF54F 
X-CRM114-Status: GOOD (  24.25  )
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

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgOToyOeKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFdoZW4gYSBndWVzdCBpbml0aWF0ZXMgYW4gU0JJX0VY
VF9QTVVfQ09VTlRFUl9DRkdfTUFUQ0ggY2FsbCB3aXRoCj4gY3RyX2Jhc2U9MHhmZmZmZmZmZmZm
ZmZmZmZlLCBjdHJfbWFzaz0weGViNWYgYW5kIGZsYWdzPTB4MQo+IChTQklfUE1VX0NGR19GTEFH
X1NLSVBfTUFUQ0gpLCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2NmZ19tYXRjaCgpCj4gZmlyc3Qg
aW52b2tlcyBrdm1fcG11X3ZhbGlkYXRlX2NvdW50ZXJfbWFzaygpIHRvIHZlcmlmeSB3aGV0aGVy
Cj4gY3RyX2Jhc2UgYW5kIGN0cl9tYXNrIGFyZSB2YWxpZCwgYnkgZXZhbHVhdGluZzoKPiAgIWN0
cl9tYXNrIHx8IChjdHJfYmFzZSArIF9fZmxzKGN0cl9tYXNrKSA+PSBrdm1fcG11X251bV9jb3Vu
dGVycyhrdnBtdSkpCj4KPiBXaXRoIHRoZSBhYm92ZSBpbnB1dHMsIF9fZmxzKDB4ZWI1ZikgZXF1
YWxzIDE1LCBhbmQgYWRkaW5nIDE1IHRvCj4gMHhmZmZmZmZmZmZmZmZmZmZlIGNhdXNlcyBhbiBp
bnRlZ2VyIG92ZXJmbG93LCB3cmFwcGluZyBhcm91bmQgdG8gMTMuCj4gU2luY2UgMTMgaXMgbGVz
cyB0aGFuIGt2bV9wbXVfbnVtX2NvdW50ZXJzKCksIHRoZSB2YWxpZGF0aW9uIHdyb25nbHkKPiBz
dWNjZWVkcy4KPgo+IFRoZXJlYWZ0ZXIsIHNpbmNlIGZsYWdzICYgU0JJX1BNVV9DRkdfRkxBR19T
S0lQX01BVENIIGlzIHNhdGlzZmllZCwKPiB0aGUgY29kZSBldmFsdWF0ZXM6Cj4gICF0ZXN0X2Jp
dChjdHJfYmFzZSArIF9fZmZzKGN0cl9tYXNrKSwga3ZwbXUtPnBtY19pbl91c2UpCj4KPiBIZXJl
IF9fZmZzKDB4ZWI1ZikgZXF1YWxzIDAsIHNvIHRlc3RfYml0KCkgcmVjZWl2ZXMgMHhmZmZmZmZm
ZmZmZmZmZmZlCj4gYXMgdGhlIGJpdCBpbmRleCBhbmQgYXR0ZW1wdHMgdG8gYWNjZXNzIHRoZSBj
b3JyZXNwb25kaW5nIGVsZW1lbnQgb2YKPiB0aGUga3ZwbXUtPnBtY19pbl91c2UsIHdoaWNoIHJl
c3VsdHMgaW4gYW4gaW52YWxpZCBtZW1vcnkgYWNjZXNzLiBUaGlzCj4gdHJpZ2dlcnMgdGhlIGZv
bGxvd2luZyBPb3BzOgo+ICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBh
dCB2aXJ0dWFsIGFkZHJlc3MgZTNlYmZmZmYxMmFiYmE4OQo+ICAgZ2VuZXJpY190ZXN0X2JpdCBp
bmNsdWRlL2FzbS1nZW5lcmljL2JpdG9wcy9nZW5lcmljLW5vbi1hdG9taWMuaDoxMjgKPiAgIGt2
bV9yaXNjdl92Y3B1X3BtdV9jdHJfY2ZnX21hdGNoIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmM6
NzU4Cj4gICBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9w
bXUuYzo0OQo+ICAga3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxsIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmM6NjA4Cj4gICBrdm1fcmlzY3ZfdmNwdV9leGl0IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhp
dC5jOjI0MAo+Cj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCBrdm1fcG11X3ZhbGlkYXRlX2NvdW50
ZXJfbWFzaygpIGRvZXMgbm90IGFjY291bnQKPiBmb3IgdGhlIGNhc2Ugd2hlcmUgY3RyX2Jhc2Ug
aXRzZWxmIGlzIG91dCBvZiByYW5nZSwgYWxsb3dpbmcgdGhlCj4gc3Vic2VxdWVudCBhZGRpdGlv
biB0byBzaWxlbnRseSBvdmVyZmxvdyBhbmQgYnlwYXNzIHRoZSBjaGVjay4KPgo+IEZpeCB0aGlz
IGJ5IGV4cGxpY2l0bHkgdmFsaWRhdGluZyBjdHJfYmFzZSBhZ2FpbnN0IGt2bV9wbXVfbnVtX2Nv
dW50ZXJzKCkKPiBiZWZvcmUgcGVyZm9ybWluZyB0aGUgYWRkaXRpb24uCj4KPiBUaGlzIGJ1ZyB3
YXMgZm91bmQgYnkgZnV6emluZyB0aGUgS1ZNIFJJU0MtViBQTVUgaW50ZXJmYWNlLgo+Cj4gRml4
ZXM6IDBjYjc0YjY1ZDJlNWU2ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBwZXJmIHN1cHBvcnQg
d2l0aG91dCBzYW1wbGluZyIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFu
dXRAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlz
Y2FzLmFjLmNuPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMQoKVGhhbmtzLApBbnVw
CgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyB8IDYgKysrKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMK
PiBpbmRleCBlODczNDMwZTU5NmIyLi5hMDk4YTliNDE3YWQ4IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4g
QEAgLTI2Niw4ICsyNjYsMTAgQEAgc3RhdGljIGludCBwbXVfY3RyX3JlYWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCj4gIHN0YXRpYyBpbnQga3ZtX3BtdV92YWxp
ZGF0ZV9jb3VudGVyX21hc2soc3RydWN0IGt2bV9wbXUgKmt2cG11LCB1bnNpZ25lZCBsb25nIGN0
cl9iYXNlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBjdHJfbWFzaykKPiAgewo+IC0gICAgICAgLyogTWFrZSBzdXJlIHRoZSB3ZSBoYXZl
IGEgdmFsaWQgY291bnRlciBtYXNrIHJlcXVlc3RlZCBmcm9tIHRoZSBjYWxsZXIgKi8KPiAtICAg
ICAgIGlmICghY3RyX21hc2sgfHwgKGN0cl9iYXNlICsgX19mbHMoY3RyX21hc2spID49IGt2bV9w
bXVfbnVtX2NvdW50ZXJzKGt2cG11KSkpCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIG51bV9jdHJz
ID0ga3ZtX3BtdV9udW1fY291bnRlcnMoa3ZwbXUpOwo+ICsKPiArICAgICAgIC8qIE1ha2Ugc3Vy
ZSB3ZSBoYXZlIGEgdmFsaWQgY291bnRlciBtYXNrIHJlcXVlc3RlZCBmcm9tIHRoZSBjYWxsZXIg
Ki8KPiArICAgICAgIGlmICghY3RyX21hc2sgfHwgY3RyX2Jhc2UgPj0gbnVtX2N0cnMgfHwgKGN0
cl9iYXNlICsgX19mbHMoY3RyX21hc2spID49IG51bV9jdHJzKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi4zNC4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
