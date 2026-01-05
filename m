Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684FEC2A062
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 04:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUAM+X4In5PhocKa0TRyMlZtmZi33K90VIBjMcIx9Mc=; b=HUFPbuVsIPkkxH
	lm6Gl+y0qT7Q8espJHiCofHqigkvKQ1+RxHTzdxfbG0FQ/yNDuO/vvw3gyHu+TD5Fe33DORfAFY5N
	kX4XafP9Adv7wiiHdBxp/RHdmVydDEEopS+DpoLaGxFWIw5IcKesvcW5cfrR0bsnj6vNyUq8hmCAY
	4BE0FiPi4HdxYDo7MKjtFIcIzEJNzhOMCXaVfSu4iZikMVVvRYg3MhdPpqM+R8ycEsC+DbxtZIvRO
	Lq/nvYiaQBEWpX13H0cc6RXLTHqMAlYKc5/VXasGe8P4qqWCIIYhZ99uX3X1BFD8KtD+yQ8f4cPDt
	D71n1Qg+mgbE7MQOFhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFu-0000000AhN9-2DrI;
	Mon, 05 Jan 2026 04:31:46 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFr-0000000AhMA-3J1R
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 04:31:44 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-3fa139e5d90so4613934fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 20:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767587503; x=1768192303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRQ6OMDCoS/pT3RqkzNsASYNjnvWbDr+adtHT2Vjro0=;
        b=h7qZKAzXwk48+MVp1eObmugA3MI6kgL7SEc70czyZR2ogaPaqa77tvcGBg3KnROssW
         cXtFsWzog9cjZRxr3gdsqWmGjl3wWn5ATDZnoKSul9oFqAXkAOkLd/xgskqXhAllX7MY
         ReC5gyYSbyQQWdOGQn8zl18u2TGEDKmGnn5e5b/3xkEm9R7wXmalCITHjNVddj9xWPYd
         Nkcx86a4nEYB93KI+vtTSGC+S/MpnWhgNc8XuEIvZXSOjQfcmMg8HwyxxG6+vkxhlJbS
         HluUswqvoZriPT1osI07J0+ClwqND4CuT+fykn56Dz0nkz4A9F48rRUjXy6RJVr1i9dR
         Fkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767587503; x=1768192303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRQ6OMDCoS/pT3RqkzNsASYNjnvWbDr+adtHT2Vjro0=;
        b=TSfy/SM7nnS2xCQ7BQxRkWD6IVb50BbY/FnUvv6ODiScUYFAOp6M3j0Bjqup+wVlT3
         7mHvxyauxg8vrwfKSQugWDqMMDN9KaL+mxOviWw2lkPIuY7TQvZ3AVjVOqDIS5N3hzMB
         hyYTCxmtNex7Ci1LmzKmfZOMTCHphGHJ5i83P8bbJhP8s0ZkaSdQvWpbgoBi1BbFCHi8
         VVPOQIwvZoJLmdclS5df808L3Fy1y75vjQ+XiCP1VxmdT5BRlMEExBviGo3T+5oDdnMV
         HcZQoRqdDDOCmz+DXeKeAOZitNj+GHXdC2qEI/rGShfPj/CmZIDx9eRl5017YersRzq8
         dsMw==
X-Forwarded-Encrypted: i=1; AJvYcCWkr9QnuFiqlCoheWVt1gP+TV4jLYuwWij7RAb6NG+ezEqFp0nzRWrMiKWef12w0DAvA+DvH2tV5KXJMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOq6a9/5nWOSq6sgIlNhd98iDrWcdg6vCu/hYqXJeSTKnO6PT+
	eF96giEGYpbDY3rYV6yi401qZmgIB85YQ1udlUYHkGFO5yMoMXVxvBdEmw6Jj+GwWPQfSQvNVeU
	BXTKIXnKW8fnOz5OUHd3kgQvmL5DrnoeRcNayAjTlIA==
X-Gm-Gg: AY/fxX5CkxuEo4jqs2aT8X9TGJy+lOL4/myDqRBzGmqOlWj+5I6nl1tYOmi7YAsft8w
	ZCD3QyJnKSYtXVZ1cD4n1EJbXeGZ67fVvV0Hcjt8rwffbMJUro/ONu/70s6VyG+Crn+OW6ZKSDd
	WxTmF88+RDLUBLYsNIgRDkXWKxRoiUqFmtP0SJFGMz9fhSK7Fqfx4gkopbAI8Mh45+GQPRAyYwt
	2DlefdW52x16jmc/wjWFX53i6ETCpv0FaI3zdEhZ6wf+VEuVhGRR9CMDDu7h1SLghJcbGPfmrwW
	etrXTjMob0tLfjQdzXVb15idNe6w4uVsXXmb6ncgMwke0CnyKsLw+tDwWg==
X-Google-Smtp-Source: AGHT+IHcKT2JR0dERW1P8mzF5izxKZvyKkjogtNi5lVp6Ef+d3be2ZXscFhYZUS/uEVX0ylkADDomixyPLXoChTBifY=
X-Received: by 2002:a05:6820:6e86:b0:65b:250c:70f0 with SMTP id
 006d021491bc7-65d0eb1f930mr13041234eaf.47.1767587503009; Sun, 04 Jan 2026
 20:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com> <20260104135938.524-2-naohiko.shimizu@gmail.com>
In-Reply-To: <20260104135938.524-2-naohiko.shimizu@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 10:01:32 +0530
X-Gm-Features: AQt7F2rYFXOkOqEixAKm3k9vFsmCv4F946k8w_SRew9TUmb4ul4n5jrOgjW2BRc
Message-ID: <CAAhSdy2dZ0neWZMyT=-b01kwAJ5XSTiBfifuqtSJ5OzvkbVOeQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_203143_835421_3CDF079B 
X-CRM114-Status: GOOD (  18.17  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjMw4oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFJWMzIsIHVwZGF0aW5nIHRoZSA2NC1i
aXQgc3RpbWVjbXAgKG9yIHZzdGltZWNtcCkgQ1NSIHJlcXVpcmVzIHR3bwo+IHNlcGFyYXRlIDMy
LWJpdCB3cml0ZXMuIEEgcmFjZSBjb25kaXRpb24gZXhpc3RzIGlmIHRoZSB0aW1lciB0cmlnZ2Vy
cwo+IGR1cmluZyB0aGVzZSB0d28gd3JpdGVzLgo+Cj4gVGhlIFJJU0MtViBQcml2aWxlZ2VkIFNw
ZWNpZmljYXRpb24gKGUuZy4sIFNlY3Rpb24gMy4yLjEgZm9yIG10aW1lY21wKQo+IHJlY29tbWVu
ZHMgYSBzcGVjaWZpYyAzLXN0ZXAgc2VxdWVuY2UgdG8gYXZvaWQgc3B1cmlvdXMgaW50ZXJydXB0
cwo+IHdoZW4gdXBkYXRpbmcgNjQtYml0IGNvbXBhcmlzb24gcmVnaXN0ZXJzIG9uIDMyLWJpdCBz
eXN0ZW1zOgo+Cj4gMS4gU2V0IHRoZSBsb3ctb3JkZXIgYml0cyAoc3RpbWVjbXApIHRvIGFsbCBv
bmVzIChVTE9OR19NQVgpLgo+IDIuIFNldCB0aGUgaGlnaC1vcmRlciBiaXRzIChzdGltZWNtcGgp
IHRvIHRoZSBkZXNpcmVkIHZhbHVlLgo+IDMuIFNldCB0aGUgbG93LW9yZGVyIGJpdHMgKHN0aW1l
Y21wKSB0byB0aGUgZGVzaXJlZCB2YWx1ZS4KPgo+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gd3Jp
dGVzIHRoZSBMU0IgZmlyc3Qgd2l0aG91dCBlbnN1cmluZyBhIGZ1dHVyZQo+IHZhbHVlLCB3aGlj
aCBtYXkgbGVhZCB0byBhIHRyYW5zaWVudCBzdGF0ZSB3aGVyZSB0aGUgNjQtYml0IGNvbXBhcmlz
b24KPiBpcyBpbmNvcnJlY3RseSBldmFsdWF0ZWQgYXMgImV4cGlyZWQiIGJ5IHRoZSBoYXJkd2Fy
ZS4gVGhpcyByZXN1bHRzIGluCj4gc3B1cmlvdXMgdGltZXIgaW50ZXJydXB0cy4KPgo+IFRoaXMg
cGF0Y2ggYWRvcHRzIHRoZSBzcGVjLXJlY29tbWVuZGVkIDMtc3RlcCBzZXF1ZW5jZSB0byBlbnN1
cmUgdGhlCj4gaW50ZXJtZWRpYXRlIDY0LWJpdCBzdGF0ZSBpcyBuZXZlciBzbWFsbGVyIHRoYW4g
dGhlIGN1cnJlbnQgdGltZS4KPgo+IEZpeGVzOiA5ZjdhOGZmNjM5MWYgKCJSSVNDLVY6IFByZWZl
ciBzc3RjIGV4dGVuc2lvbiBpZiBhdmFpbGFibGUiKQo+IFNpZ25lZC1vZmYtYnk6IE5hb2hpa28g
U2hpbWl6dSA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCgo+IC0tLQo+
ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1yaXNjdi5jCj4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0ZDgzYzQyYzAgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gKysrIGIvZHJpdmVycy9jbG9j
a3NvdXJjZS90aW1lci1yaXNjdi5jCj4gQEAgLTUwLDggKzUwLDkgQEAgc3RhdGljIGludCByaXNj
dl9jbG9ja19uZXh0X2V2ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEsCj4KPiAgICAgICAgIGlmIChz
dGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpKSB7Cj4gICNpZiBkZWZp
bmVkKENPTkZJR18zMkJJVCkKPiAtICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNN
UCwgbmV4dF90dmFsICYgMHhGRkZGRkZGRik7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShD
U1JfU1RJTUVDTVAsIFVMT05HX01BWCk7Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1Jf
U1RJTUVDTVBILCBuZXh0X3R2YWwgPj4gMzIpOwo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUo
Q1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZGKTsKPiAgI2Vsc2UKPiAgICAgICAg
ICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiAgI2VuZGlmCj4g
LS0KPiAyLjM5LjUKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
