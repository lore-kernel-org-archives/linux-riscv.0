Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204E3C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFRecCcW3QPNONBA49/BjwowNtr3VC89QjRBrj6NTZk=; b=REu4GElum2Jmjz
	fqgo/iYm/qvYTomker1prA9VF5e0a0pMmpQth5lVMzW5vLUIL9iQjR2b6PCC9ozzXa44QuQyuSYhX
	tsRez/vjGbCPUUXhiSRSRvYpZ8fDfynpeNEb635d/W7gmZlHSZqXoOQwPBS/Vcud/Gt6tWPZYJIDn
	5g6zOBnzJNNkW7D4h9SZ9fR7UgoO/lzhPZYMkoLs1EC2HbmU/whrdu3pJCpElNBkVRF+HyMgjNOw1
	CgQIwtXKMuCbe710Sq8CvOycgND1FVNzdHMnWByXS+Eha5Ot086b7iAcfGKx8MurG50+u3nyeG3QK
	vksPXJar5xMFubsXDXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7atm-00000004xT1-1XM4;
	Thu, 16 May 2024 13:11:54 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ate-00000004xRS-3g5D
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 13:11:49 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6277a2bb35fso5282567b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715865106; x=1716469906; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V904prVi6oQ5IyZz7aDLXAgfOChEzLZtTfRAaiZkwU=;
        b=ZGPW5atPMilNOtEQW8lQUcJJd6tjCKpjwcCkJ3fCAZnGnKW4cRbwv6t0iwHCInb6Lb
         YzbLXNheVILN/PEY9foCy+WaaopT5reO9FjaOJg51VYheo6/BEnf9Is2jMYFfAGlHR6r
         TTUy+snn3TCVovCu2/RzNQjKUVZGnj+7zPrV5eKjvdmhBE+M+mj41p8/g7004avArC68
         GPdkgXT9ezTw07R7ojPR9E8iVJo/7fdpQUqGvmUSQv3oQTuaLc4gW/XteMFK5TPWq11I
         /snIi2TKxIacLuq6yIVccao6raA4ll4TMrCdhb4BqVPjIu2mPVWf01+OqB1mslu6mr/w
         o+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715865106; x=1716469906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V904prVi6oQ5IyZz7aDLXAgfOChEzLZtTfRAaiZkwU=;
        b=W52C4yBaSM/QfyFiVH3oGfFShVwueyabpMmGlHfKRQ0sInBA5juD9EQWsxppuSRXDX
         y0k6YumrvXtXVz04qW8vtw/Rl6AzwQAA5j1S2FGay+eN78S8BR0FlJIGD+ggYwZvh5XN
         kpEOOWYMihakJe/XvrT+sF8OWeNuuY7RLCGh5d4+VnWqr4tAI+/F9ylGJ61jb5DOdghl
         bYCP7QS0tx3EaFO+OmvdmhPeEeDDLYwnPH3jEV951lKAwYrA7UBXIqI0zIlao2ENvveM
         6zUJ3/dBahrkTr9/s4GVZ+YXPEoaWI3Z7E+tj4eNA08VTSnbX0CLV8/LmIegJ8uRJjpw
         Gtcg==
X-Forwarded-Encrypted: i=1; AJvYcCVcYUekJtQgSJOB9nWG7ZDItbUKmQO+xxJz6RGyNIoYe+q0KL58evEsFH69sGev098D1egXSIZSHer7N9TEhBpCuHQ14eVqchGzwt7jj4IH
X-Gm-Message-State: AOJu0YxXGhOOqHyiFB2+NoGKBppvOvUjvkF7fn0s2/D0+eFkBauelEHM
	vE5XMTrTJxxm0ckCkBhooIYM7qvdhIj9wbgjRJTIb9l+i5U8P7Gq8XcjMPRH1vBecciaIdexA25
	pLTuLdf5MEc0jpOXsENtpWQ+UdcWRYbeitW8dRA==
X-Google-Smtp-Source: AGHT+IH5FRDo7BDlg+tWZAgAOlCiAfHazME5mq8JEMAmJ+ns26s+bWNHf5N3/miLQXMAqpV9jaca9Qw0iocuCcuU1Ac=
X-Received: by 2002:a81:77c2:0:b0:618:9198:1a9b with SMTP id
 00721157ae682-622af7af307mr115191067b3.3.1715865105680; Thu, 16 May 2024
 06:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 May 2024 21:11:33 +0800
Message-ID: <CABgGipUJ1hk_N6Vka2j12o80bxpDbAadJVBHdoLncrQEaBPoaw@mail.gmail.com>
Subject: Re: [PATCH v6 03/17] riscv: vector: Use vlenb from DT
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_061146_961357_32C70A3E 
X-CRM114-Status: GOOD (  27.34  )
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

T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAyOjIx4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBJZiB2bGVuYiBpcyBwcm92aWRlZCBpbiB0aGUgZGV2
aWNlIHRyZWUsIHByZWZlciB0aGF0IG92ZXIgcmVhZGluZyB0aGUKPiB2bGVuYiBjc3IuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgoKSSBh
Z3JlZSB3aXRoIENvbm9yIHRoYXQgd2UgbmVlZCBhIG1lY2hhbmlzbSB0byB0dXJuIG9mZiB2IGFu
ZCBhbGwKZGVwZW5kaW5nIGV4dGVuc2lvbnMgd2l0aCBoYXNfcmlzY3ZfaG9tb2dlbmVvdXNfdmxl
bmIoKS4gQW5kIHRoYXQgY2FuCmNvbWUgYWZ0ZXIgdGhpcy4KClRoYW5rcyBmb3IgYWRkaW5nIHRo
ZSBob21vZ2VuZW91cyB2bGVuIGNoZWNraW5nIQoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5k
eS5jaGl1QHNpZml2ZS5jb20+Cgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZl
YXR1cmUuaCB8ICAyICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgIHwg
NDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC92ZWN0b3IuYyAgICAgICAgICB8IDEyICsrKysrKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA2MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nw
dWZlYXR1cmUuaAo+IGluZGV4IDM0NzgwNTQ0NjE1MS4uMGM0ZjA4NTc3MDE1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiBAQCAtMzEsNiArMzEsOCBAQCBERUNMQVJFX1BF
Ul9DUFUoc3RydWN0IHJpc2N2X2NwdWluZm8sIHJpc2N2X2NwdWluZm8pOwo+ICAvKiBQZXItY3B1
IElTQSBleHRlbnNpb25zLiAqLwo+ICBleHRlcm4gc3RydWN0IHJpc2N2X2lzYWluZm8gaGFydF9p
c2FbTlJfQ1BVU107Cj4KPiArZXh0ZXJuIHUzMiByaXNjdl92bGVuYl9vZjsKPiArCj4gIHZvaWQg
cmlzY3ZfdXNlcl9pc2FfZW5hYmxlKHZvaWQpOwo+Cj4gICNpZiBkZWZpbmVkKENPTkZJR19SSVND
Vl9NSVNBTElHTkVEKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCAzZWQyMzU5ZWFlMzUu
LjZjMTQzZWE5NTkyYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMzUsNiArMzUs
OCBAQCBzdGF0aWMgREVDTEFSRV9CSVRNQVAocmlzY3ZfaXNhLCBSSVNDVl9JU0FfRVhUX01BWCkg
X19yZWFkX21vc3RseTsKPiAgLyogUGVyLWNwdSBJU0EgZXh0ZW5zaW9ucy4gKi8KPiAgc3RydWN0
IHJpc2N2X2lzYWluZm8gaGFydF9pc2FbTlJfQ1BVU107Cj4KPiArdTMyIHJpc2N2X3ZsZW5iX29m
Owo+ICsKPiAgLyoqCj4gICAqIHJpc2N2X2lzYV9leHRlbnNpb25fYmFzZSgpIC0gR2V0IGJhc2Ug
ZXh0ZW5zaW9uIHdvcmQKPiAgICoKPiBAQCAtNjQ4LDYgKzY1MCw0NiBAQCBzdGF0aWMgaW50IF9f
aW5pdCByaXNjdl9pc2FfZmFsbGJhY2tfc2V0dXAoY2hhciAqX191bnVzZWQpCj4gIGVhcmx5X3Bh
cmFtKCJyaXNjdl9pc2FfZmFsbGJhY2siLCByaXNjdl9pc2FfZmFsbGJhY2tfc2V0dXApOwo+ICAj
ZW5kaWYKPgo+ICtzdGF0aWMgaW50IGhhc19yaXNjdl9ob21vZ2VuZW91c192bGVuYih2b2lkKQo+
ICt7Cj4gKyAgICAgICBpbnQgY3B1Owo+ICsgICAgICAgdTMyIHByZXZfdmxlbmIgPSAwOwo+ICsg
ICAgICAgdTMyIHZsZW5iOwo+ICsKPiArICAgICAgIC8qIElnbm9yZSB2bGVuYiBpZiB2ZWN0b3Ig
aXMgbm90IGVuYWJsZWQgaW4gdGhlIGtlcm5lbCAqLwo+ICsgICAgICAgaWYgKCFJU19FTkFCTEVE
KENPTkZJR19SSVNDVl9JU0FfVikpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiAr
ICAgICAgIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKPiArICAgICAgICAgICAgICAgc3Ry
dWN0IGRldmljZV9ub2RlICpjcHVfbm9kZTsKPiArCj4gKyAgICAgICAgICAgICAgIGNwdV9ub2Rl
ID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWNw
dV9ub2RlKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiVW5hYmxlIHRvIGZp
bmQgY3B1IG5vZGVcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5U
Owo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVy
dHlfcmVhZF91MzIoY3B1X25vZGUsICJyaXNjdix2bGVuYiIsICZ2bGVuYikpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChjcHVfbm9kZSk7Cj4gKwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChwcmV2X3ZsZW5iKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7
Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGlmIChwcmV2X3ZsZW5i
ICYmIHZsZW5iICE9IHByZXZfdmxlbmIpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBvZl9u
b2RlX3B1dChjcHVfbm9kZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIHByZXZfdmxlbmIg
PSB2bGVuYjsKPiArICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoY3B1X25vZGUpOwo+ICsgICAg
ICAgfQo+ICsKPiArICAgICAgIHJpc2N2X3ZsZW5iX29mID0gdmxlbmI7Cj4gKyAgICAgICByZXR1
cm4gMDsKPiArfQo+ICsKPiAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQo+ICB7
Cj4gICAgICAgICBjaGFyIHByaW50X3N0cltOVU1fQUxQSEFfRVhUUyArIDFdOwo+IEBAIC02NzEs
NiArNzEzLDExIEBAIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBwcl9pbmZvKCJGYWxsaW5nIGJhY2sgdG8gZGVwcmVjYXRlZCBcInJp
c2N2LGlzYVwiXG4iKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdl9maWxsX2h3Y2Fw
X2Zyb21faXNhX3N0cmluZyhpc2EyaHdjYXApOwo+ICAgICAgICAgICAgICAgICB9Cj4gKwo+ICsg
ICAgICAgICAgICAgICBpZiAoZWxmX2h3Y2FwICYgQ09NUEFUX0hXQ0FQX0lTQV9WICYmIGhhc19y
aXNjdl9ob21vZ2VuZW91c192bGVuYigpIDwgMCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHByX3dhcm4oIlVuc3VwcG9ydGVkIGhldGVyb2dlbmVvdXMgdmxlbiBkZXRlY3RlZCwgdmVjdG9y
IGV4dGVuc2lvbiBkaXNhYmxlZC5cbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVsZl9o
d2NhcCAmPSB+Q09NUEFUX0hXQ0FQX0lTQV9WOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAg
ICB9Cj4KPiAgICAgICAgIC8qCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rv
ci5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiBpbmRleCA2NzI3ZDFkM2I4ZjIuLmUw
NDU4NmNkYjdmMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gQEAgLTMzLDcgKzMzLDE3IEBAIGludCBy
aXNjdl92X3NldHVwX3ZzaXplKHZvaWQpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdGhp
c192c2l6ZTsKPgo+IC0gICAgICAgLyogVGhlcmUgYXJlIDMyIHZlY3RvciByZWdpc3RlcnMgd2l0
aCB2bGVuYiBsZW5ndGguICovCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogVGhlcmUgYXJlIDMy
IHZlY3RvciByZWdpc3RlcnMgd2l0aCB2bGVuYiBsZW5ndGguCj4gKyAgICAgICAgKgo+ICsgICAg
ICAgICogSWYgdGhlIHJpc2N2LHZsZW5iIHByb3BlcnR5IHdhcyBwcm92aWRlZCBieSB0aGUgZmly
bXdhcmUsIHVzZSB0aGF0Cj4gKyAgICAgICAgKiBpbnN0ZWFkIG9mIHByb2JpbmcgdGhlIENTUnMu
Cj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChyaXNjdl92bGVuYl9vZikgewo+ICsgICAgICAg
ICAgICAgICB0aGlzX3ZzaXplID0gcmlzY3ZfdmxlbmJfb2YgKiAzMjsKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgcmlzY3Zfdl9lbmFibGUoKTsK
PiAgICAgICAgIHRoaXNfdnNpemUgPSBjc3JfcmVhZChDU1JfVkxFTkIpICogMzI7Cj4gICAgICAg
ICByaXNjdl92X2Rpc2FibGUoKTsKPgo+IC0tCj4gMi40NC4wCj4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
