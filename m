Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF16FC61DE2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 01:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtcYP9pLMV9Nk9FGLuvd0ul0j+91aOWBonHX1wYdY7A=; b=g2SCG++5hRkq/Z
	wx8vyiiq8q0lZzRO2RpJ5/tdE7r+GSJ/vojDocrx8OgtTkNt8u7D2BWWNty+8sSeMmm+ojsBIVWFO
	xlD8+LfZhaMGrULUYBArKLA8ZxtJvh9rIYu3+9z36eeVH9WAoud/iOkK+3YH8lsysEAIAT+q1YuI9
	0NenbyGaU2d0FWSkTwb7jBslKFXuvgQ8rX1WxZupu1j/1MnD/bnh0rd2O0alvv2LhP3hmXMNLBMbz
	eZEEuC2/SLrEUTr/NwhwOvEMULmIuTJlxNMo4PA5P5+baXkEb0m2g4LX/wgSILXEckXxVAVV6QFTb
	T8OUFnTYR9uGEhW3E+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rDP-00000008KMH-34R4;
	Mon, 31 Aug 2026 01:53:39 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rDM-00000008KLk-2iaP
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 01:53:38 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-45eb2e6402aso2139225fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2026 18:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788141214; cv=none;
        d=google.com; s=arc-20260327;
        b=Offjh7y8pCz7OxdFfqS4azDww3/kd9Lv3zTo/2m/1mrj4DMhBE6/oeMC0nc//x7H/j
         vmQirFZu1lwnw0zQxq2WkiEqnp36Npu94303VQtCdhKxqUu3XO55QjGba+adMx4L2cUs
         1tkxQJ+ZSkPPNhpv4ZeNk20yITkVMXkQOHShkmJqa4zbBze9XraEAFwiEHRi31rUKa/H
         KPXa6/eUF3MHZ1BL5ss7deWMzz9JsuqAoYbzgVhfY7Zp3ZiWtHftkGajYl5zqOZfaX2A
         Kt8EiAiW7nQUz+6bLJ7X4d1KVHUMiBxeqS+O3TshIgD+zK96o26IX75gkM2hlZOTkPSD
         94Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFCZRK0obCqsSewBN+OQbRCoia7TdC4zUDvGsngmACA=;
        fh=dR7SoprlOlbGS7pjtCLGKoBt+GSmI5wpLqbLYm3snaQ=;
        b=q2b2/HrOoZb+FVi5L1A6ua8Km10fcEXrajwjSE6o1zMDp8sQHPa61dPlsrxAuYdjRk
         84mxAGhL64cEZrFphRybv9AsIhPb9rY/plnICCW6zTmf49EU7GUp6/+auV+hUKcX15l8
         bJNSDk1r4ozpicciuzJBMhG4Zk1gXRGMPBRI9hyY9SWrv8STER4jL1oG1LYwnlxM6pl9
         na9KPfroh2zmuasYX2Dcxn+aYPVupb+ecKoZh3bEkj8+mZJks1Sm1YFwiwJHH/d+xEgN
         FLrUe+vSK6kKa5+0/F34eRBGfSD+7wlDeg6xCmzCABK+sOYcVHU8aT25u33GsNAvjBVF
         UQPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788141214; x=1788746014; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFCZRK0obCqsSewBN+OQbRCoia7TdC4zUDvGsngmACA=;
        b=MTLKFYSlqujgTB2SDPhqjvdoq9i1HlRxCF3/JrcX3IN8MkFLG8s4d3Y2fxcxsw1svC
         MyNKqdipUOwRFGOSKy840QeNmiMyMD3t+VIRqqix8Y5oR25bsOgv0emBtxzuUIHo6LSx
         sx/xcDJHLdf5uu2M7LJlTzAdq9vovmf9qu0xqslsiVm4y2npcksrqtwUV7wkCE/PEW1N
         QgTGu+pqAtZnL3o9L12FkH+FjoYcylspRcSbaCzEG+plGXkjjPS5gL0lQyBGtFg+Keuh
         WJuavPWEGsrWegPn10czvYm6pbUbdCY3IamPlDYOZvfnfmDH4V1pyTebepd/QZP11Y/S
         Iaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141214; x=1788746014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFCZRK0obCqsSewBN+OQbRCoia7TdC4zUDvGsngmACA=;
        b=Q0G1LQDxKcP+fzaW2YWiZROfPE3LLlpAM4M+HHpPzJKLBcmU9cj21TdVcyQ0vGvqU5
         5SeYY8t3LFTjPJolAqyM+wf3FWthQgTnFQ1UDRAG63En01U0WTiyOUqiHzfl955mbLKJ
         HEkT8dGsZbVjqlkH7qRw1GY8tpr89T0ggP+Sknyy0oJMsDfiBmtFvzquD0dm4W0vIYWo
         TQp6NJAnFBafIzO2PVWL7WYzQUeeG0O9/XG7yKFb9ohDUMYrTvHgkwR6mK/acSQxiDSc
         v2vj7qdH+qHoBmnJz98JJJu1iclDO5sIe1eEiEhBvskRwOWUBhwBqmajb0lrv+X6nO4D
         HH5g==
X-Forwarded-Encrypted: i=1; AHgh+Roo33N2dlaTFINxa7k0/gko32kJ/LY2vm5qOn8Vg7HcdJfY156rCApQlqmONDZj3GCczrrhVmwL00gpZw==@lists.infradead.org
X-Gm-Message-State: AFuF++k7ypxlxrwiKqs6K8WB1cYk7JO6JAJRgOm9KO3ytrWy33yjIKVW
	i5N63dmVB2V2qeSkElBztNFLWjUK5s4TU5be9Gf6tTgq/amp1ikFVaoCfoDJiPmWw3VWDMa4YIT
	AbLWGsoMknc4hOfJJbXmKigSUX3GVpdr732eqm06U6ahyuotr72518NnQo3j6
X-Gm-Gg: AR+sD13tTbBxykKF+QbVOW/mqmB4bWbnpOU6x8KV/liteIcDj8MAAsPDdfyNVwL2tzL
	sRNpOA0GaiFPkLuQefpITSRvqOpc/H2IJv9frofWaETOHip9nHbXvtGGUjyyN93CtP32QDcovle
	es14FCZUCeseHPzB1kktD1RH2upRfOmAzbxuNlPNTuzbG1fahkcGcnnJi2HB52srbv1M+/n/mez
	KUekGReLkNy0Pd2Sqv4pDF5CKf9sX8uXEpR7KzD4VXazpXDgjv8vQtRFekTXCsDjpdsXPzeMkgm
	Bawm4KcRmrdtcmShpiA3cSCuDEoGYowyAi5Fq/3aRKSjLzlH
X-Received: by 2002:a05:6870:6b92:b0:446:eba3:a1ad with SMTP id
 586e51a60fabf-46836af8eb9mr27206979fac.10.1788141214549; Sun, 30 Aug 2026
 18:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
 <CAJh9TSJWr8eLG=9_UjwdOqwUqfsCxaAJb8NUUJ9NKjnmPcLSPA@mail.gmail.com> <CAPx+jO9x304geo422e6PGNGPNsgSPAKcqUUyX244jOwy7fNw3w@mail.gmail.com>
In-Reply-To: <CAPx+jO9x304geo422e6PGNGPNsgSPAKcqUUyX244jOwy7fNw3w@mail.gmail.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Mon, 31 Aug 2026 09:53:23 +0800
X-Gm-Features: AcwNN1W1_Zlv2vvXHJazEehhIWYcIHWo64rI6KrpOohup-FuB_YQrq7I1-_z_Q8
Message-ID: <CAJh9TSK0CJPWGFQYFcWmA4TqcZuDTdrmOduBzZHVgSQVomCZeg@mail.gmail.com>
Subject: Re: RISC-V genpd race in OSI mode (genpd domain power_off vs firmware
 suspend call)
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>, rafael@kernel.org, daniel.lezcano@linaro.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	ulfh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_185336_743071_E8179DCA 
X-CRM114-Status: GOOD (  40.37  )
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

SWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgeW91IGFyZSByZWZlcnJpbmcgdG8gYSBtZWNoYW5p
c20gc2ltaWxhciB0bwpwc2NpX3ZhbGlkYXRlX3N0YXRlX2Nvb3JkaW5hdGlvbiBpbiBQU0NJLgpI
b3dldmVyLCB0aGVyZSBpcyBhIHRpbWUgd2luZG93IGJldHdlZW4gdGhlIGdlbnBkIGNhbGxpbmcg
dGhlCnBvd2VyX29mZiBjYWxsYmFjayBhbmQgdGhlIGFjdHVhbCBleGVjdXRpb24gb2YKcHNjaV92
YWxpZGF0ZV9zdGF0ZV9jb29yZGluYXRpb24uCkR1cmluZyB0aGlzIHdpbmRvdywgYW5vdGhlciBj
b3JlIGNvdWxkIHdha2UgdXAsIGVudGVyIExpbnV4LCB0dXJuIHRoZQpjbHVzdGVyIGdlbnBkIGJh
Y2sgb24sCmFuZCBjb21wbGV0ZSBpdHMgb3duIHN1c3BlbmQgc2VxdWVuY2UgYmVmb3JlIHRoZSBp
bml0aWFsIGNvcmUgZmluaXNoZXMKc3VzcGVuZGluZy4KQ29uc2VxdWVudGx5LCB0aGUgaW5pdGlh
bCBjb3JlIHJlbWFpbnMgdW5hd2FyZSB0aGF0IGFub3RoZXIgY29yZSBoYWQKd29rZW4gdXAgZHVy
aW5nIHRoYXQgaW50ZXJ2YWwuCgpCZXN0IHJlZ2FyZHMKSmltbXkgSG8KCk9uIEZyaSwgQXVnIDI4
LCAyMDI2IGF0IDg6NTXigK9QTSBVbGYgSGFuc3Nvbgo8dWxmLmhhbnNzb25Ab3NzLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAyOCwgMjAyNiBhdCA3OjAz4oCvQU0gSmltbXkg
SG8gPGppbW15LmhvQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IFJlc2VuZGluZyB0aGlzIGZv
bGxvdy11cCB0byBVbGbigJlzIGN1cnJlbnQgYWRkcmVzcwo+ID4KPiA+IE9uIEZyaSwgQXVnIDI4
LCAyMDI2IGF0IDEyOjU24oCvUE0gSmltbXkgSG8gPGppbW15LmhvQHNpZml2ZS5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBIaSBsaW51eC1wbSwKPiA+ID4KPiA+ID4gV2UgaGl0IGEgcmFjZSBjb25k
aXRpb24gaW52b2x2aW5nIGdlbnBkJ3MgQ1BVIFBNIGRvbWFpbiAoT1NJLW1vZGUKPiA+ID4gaGll
cmFyY2hpY2FsIGNwdWlkbGUsIHNpbWlsYXIgdG8gdGhlIEFSTSBQU0NJIE9TSSBtb2RlbCkgb24g
YSBSSVNDLVYKPiA+ID4gcGxhdGZvcm0sIGFuZCB3b3VsZCBsaWtlIHRvIGdldCB5b3VyIG9waW5p
b24gb24gd2hldGhlciB0aGlzIGlzIGEKPiA+ID4gZ2VucGQtbGV2ZWwgaXNzdWUgYW5kIHdoYXQg
dGhlIHByZWZlcnJlZCBnZW5lcmljIGZpeCB3b3VsZCBsb29rIGxpa2UuCj4gPiA+Cj4gPiA+IEJh
Y2tncm91bmQKPiA+ID4gLS0tLS0tLS0tLQo+ID4gPiBPYnNlcnZlZCB0aGlzIGlzc3VlIG9uIHFl
bXUgcGxhdGZvcm0KPiA+ID4gT24gb3VyIFNvQywgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1h
cGxpYy1tYWluLmMgcmVnaXN0ZXJzIGEgZ2VucGQKPiA+ID4gbm90aWZpZXIgdG8gc2F2ZS9yZXN0
b3JlIHRoZSBTLW1vZGUgQVBMSUMgY29udGV4dDoKPiA+ID4KPiA+ID4gICBhcGxpY19ub3RpZmll
cigpCj4gPiA+ICAgICBHRU5QRF9OT1RJRllfUFJFX09GRiAtPiBhcGxpY19zYXZlKCkKPiA+ID4g
ICAgIEdFTlBEX05PVElGWV9PTiAgICAgIC0+IGFwbGljX3Jlc3RvcmUoKQo+ID4gPgo+ID4gPiBD
UFVzIGFyZSBhdHRhY2hlZCB0byB0aGlzIGdlbnBkIHZpYSBkdF9pZGxlX2F0dGFjaF9jcHUoKSAo
YXMgaW4KPiA+ID4gZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMsIG1pcnJvcmlu
ZyBjcHVpZGxlLXBzY2kuYykuIFdoZW4KPiA+ID4gdGhlIGxhc3QgQ1BVIGluIHRoZSBkb21haW4g
Z29lcyBpZGxlLCBnZW5wZF9wb3dlcl9vZmYoKSBkZWNpZGVzIHRoZQo+ID4gPiBkb21haW4gY2Fu
IGJlIHR1cm5lZCBvZmYgKGJhc2VkIG9uIHRoZSAibm90X3N1c3BlbmRlZCIgY291bnQgY29tcHV0
ZWQKPiA+ID4gdW5kZXIgZ2VucGRfbG9jaykuIFdoZW4gdGhlIGZpcnN0IENQVQo+ID4gPiByZXN1
bWVzLCBnZW5wZF9wb3dlcl9vbigpIGRlY2lkZXMgdG8gdHVybiB0aGUgZG9tYWluIGJhY2sgb24g
YW5kIGZpcmVzCj4gPiA+IEdFTlBEX05PVElGWV9PTiwgd2hpY2ggdHJpZ2dlcnMgYXBsaWNfcmVz
dG9yZSgpLgo+ID4gPgo+ID4gPiBIb3dldmVyLCB0aGUgYWN0dWFsIFNCSSBIU00gc3VzcGVuZCBj
YWxsIChyaXNjdl9zYmlfaGFydF9zdXNwZW5kKCksCj4gPiA+IHNpbWlsYXIgdG8gYSBQU0NJIENQ
VV9TVVNQRU5EIGNhbGwpIGlzICpub3QqIGlzc3VlZCBpbnNpZGUKPiA+ID4gZ2VucGRfbG9jay4g
Z2VucGQncyBwb3dlcl9vZmYoKSBjYWxsYmFjayBvbmx5IHJlY29yZHMgd2hpY2ggZG9tYWluCj4g
PiA+IGlkbGUgc3RhdGUgd2FzIHNlbGVjdGVkOyB0aGUgcmVhbCBmaXJtd2FyZSBzdXNwZW5kIGNh
bGwgaGFwcGVucyBsYXRlciwKPiA+ID4gYXN5bmNocm9ub3VzbHksIG9uIGVhY2ggQ1BVJ3Mgb3du
IGNwdWlkbGUgZW50ZXIgcGF0aAo+ID4gPiAoX19zYmlfZW50ZXJfZG9tYWluX2lkbGVfc3RhdGUo
KSkuCj4gPiA+Cj4gPiA+IFRoZSByYWNlCj4gPiA+IC0tLS0tLS0tCj4gPiA+IEJlY2F1c2Ugb2Yg
dGhpcyBnYXAgYmV0d2VlbiAiZ2VucGQncyBzb2Z0d2FyZSBkZWNpc2lvbiB0aGF0IHRoaXMgQ1BV
Cj4gPiA+IGlzIGxhc3QtbWFuIC8gZmlyc3QtbWFuIiBhbmQgInRoZSBDUFUgYWN0dWFsbHkgaXNz
dWluZyB0aGUgZmlybXdhcmUKPiA+ID4gc3VzcGVuZC9yZXN1bWUgY2FsbCIsIHdlIG9ic2VydmVk
IHRoZSBmb2xsb3dpbmcgc2VxdWVuY2UKPiA+ID4KPiA+ID4gMS4gQ1BVMCByZXF1ZXN0cyBhIHN5
c3RlbSBkb21haW4tbGV2ZWwgcG93ZXItZ2F0ZSAoZGVlcCBzbGVlcCwgdGVhcnMgZG93biB0aGUK
PiA+ID4gICAgc2hhcmVkIFMtbW9kZSBBUExJQyBjb250ZXh0KSBhbmQgaGFuZHMgb2ZmIHRvIGZp
cm13YXJlLgo+ID4gPiAyLiBCZWZvcmUgQ1BVMCdzIHJlcXVlc3QgaXMgcGh5c2ljYWxseSBjb21w
bGV0ZWQsIENQVTEgd2FrZXMgdXAsCj4gPiA+ICAgIGdlbnBkX3Bvd2VyX29uKCkgcnVucywgR0VO
UERfTk9USUZZX09OIGZpcmVzLCBhcGxpY19yZXN0b3JlKCkgcnVucy4KPiA+ID4gMy4gQ1BVMSBn
b2VzIGlkbGUgYWdhaW4sIGJ1dCB0aGlzIHRpbWUgc3lzdGVtIGRvbWFpbi1sZXZlbCBnZW5wZCBy
ZWplY3QKPiA+ID4gICAgcmVxdWVzdCwgc28gaXQgZmFsbGJhY2sgdG8gY29yZSBsZXZlbCBwb3dl
ci1nYXRlCj4gPiA+IDQuIENQVTAncyBvcmlnaW5hbCBzeXN0ZW0gZGVlcCBwb3dlci1nYXRlIHJl
cXVlc3QgZXZlbnR1YWxseSBjb21wbGV0ZXMgYXQgdGhlCj4gPiA+ICAgIGZpcm13YXJlIGxldmVs
IC0tIHBoeXNpY2FsbHkgY29sbGFwc2luZyB0aGUgc3lzdGVtIGRvbWFpbiwgaW5jbHVkaW5nIHRo
ZQo+ID4gPiAgICBTLW1vZGUgQVBMSUMgY29udGV4dCwgc2F2ZWQgZWFybGllciBieSBhcGxpY19z
YXZlKCkKPiA+ID4gNS4gQ1BVMCB3YWtlcyB1cCAoZS5nLiBVQVJUIGludGVycnVwdCksIGVudGVy
cyBMaW51eCwgYnV0IHN5c3RlbSBnZW5wZCdzCj4gPiA+ICAgIHNvZnR3YXJlIHN0YXRlIHN0aWxs
IHNheXMgdGhlIGRvbWFpbiBpcyAib24iIChmcm9tIHN0ZXAgMiksIHNvIHN5c3RlbSBkb21haW4K
PiA+ID4gICAgR0VOUERfTk9USUZZX09OIHdpbGwgbm90IGJlIGZpcmVkIGFnYWluIGFuZCBhcGxp
Y19yZXN0b3JlKCkgd2lsbCBub3QgYmUKPiA+ID4gICAgY2FsbGVkCj4gPiA+Cj4gPiA+IFRoaXMg
bG9va3Mgc3RydWN0dXJhbGx5IGlkZW50aWNhbCB0byB0aGUgcmFjZSBURi1BJ3MgUFNDSSBPUy1p
bml0aWF0ZWQKPiA+ID4gbW9kZSBkb2N1bWVudGF0aW9uIGRlc2NyaWJlczoKPiA+ID4gaHR0cHM6
Ly90cnVzdGVkZmlybXdhcmUtYS5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvZGVzaWduX2RvY3Vt
ZW50cy9wc2NpX29zaV9tb2RlLmh0bWwjcmFjZXMtaW4tb3MtaW5pdGlhdGVkLW1vZGUKPiA+ID4K
PiA+ID4KPiA+ID4gICAiSW4gT1MtaW5pdGlhdGVkIG1vZGUsIHRoZXJlIGFyZSByYWNlIHdpbmRv
d3Mgd2hlcmUgdGhlIE9TJ3Mgdmlldwo+ID4gPiAgIGFuZCBpbXBsZW1lbnRhdGlvbidzIHZpZXcg
b2YgdGhlIHN5c3RlbSdzIHN0YXRlIGRpZmZlci4uLiB0aGUgT1MKPiA+ID4gICBtaWdodCByZXF1
ZXN0IGEgcG93ZXJkb3duIHN0YXRlIGZvciBhIG5vZGUgZnJvbSBvbmUgY29yZSwgd2hpbGUgYXQK
PiA+ID4gICB0aGUgc2FtZSB0aW1lLCB0aGUgaW1wbGVtZW50YXRpb24gb2JzZXJ2ZXMgdGhhdCBh
bm90aGVyIGNvcmUgaW4KPiA+ID4gICB0aGF0IG5vZGUgaXMgcG93ZXJpbmcgdXAuIgo+ID4gPgo+
ID4gPiBURi1BJ3MgYW5zd2VyIGlzIHRvIHJlcXVpcmUgdGhlIE9TIHRvIGVuY29kZSBhICJsYXN0
X2F0X3B3cmx2bCIgZmllbGQKPiA+ID4gaW50byB0aGUgU3RhdGVJRCBwYXNzZWQgdG8gQ1BVX1NV
U1BFTkQsIHdoaWNoIGZpcm13YXJlIHZhbGlkYXRlcwo+ID4gPiBhZ2FpbnN0IGl0cyBvd24gdmll
dyBvZiBzeXN0ZW0gc3RhdGUgYmVmb3JlIGhvbm9yaW5nIGEgcG93ZXJkb3duCj4gPiA+IHJlcXVl
c3QuIFdlIGNvdWxkIG5vdCBmaW5kIGFueSBjb2RlIGluIGN1cnJlbnQgbWFpbmxpbmUgTGludXgK
PiA+ID4gKGNwdWlkbGUtcHNjaS5jIG9yIGdlbmVyaWMgY3B1aWRsZS9nZW5wZCBjb2RlKSB0aGF0
IGFjdHVhbGx5IGNvbXB1dGVzCj4gPiA+IGFuZCBlbmNvZGVzIHRoaXMgZmllbGQgZHluYW1pY2Fs
bHkgcGVyIHN1c3BlbmQgY2FsbCwgc28gYXMgZmFyIGFzIHdlCj4gPiA+IGNhbiB0ZWxsIHRoaXMg
cmFjZSBpcyB1bmhhbmRsZWQgZ2VuZXJpY2FsbHkgdG9kYXksIG9uIGJvdGggYXJtL3BzY2kKPiA+
ID4gYW5kIHJpc2N2L3NiaSBiYWNrZW5kcy4KPiA+ID4KPiA+ID4gT3B0aW9ucyB3ZSBjb25zaWRl
cmVkCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gMS4gSW1wbGVtZW50IHNvbWV0
aGluZyBsaWtlIFBTQ0kncyBsYXN0X2F0X3B3cmx2bCBnZW5lcmljYWxseTogZXhwb3NlCj4gPiA+
ICAgIGdlbnBkJ3MgYWxyZWFkeS1jb21wdXRlZCAiYW0gSSB0aGUgbGFzdCBDUFUgaW4gdGhpcyBk
b21haW4iCj4gPiA+ICAgIGluZm9ybWF0aW9uIHRocm91Z2ggdGhlIHBvd2VyX29mZigpIGNhbGxi
YWNrIEFQSSwgc28KPiA+ID4gICAgYmFja2VuZHMgY2FuIHBhc3MgaXQgZG93biB0byBmaXJtd2Fy
ZSwgYW5kIGhhdmUgZmlybXdhcmUgdmFsaWRhdGUvCj4gPiA+ICAgIHJlamVjdCBzdGFsZSByZXF1
ZXN0cy4KPiA+ID4gICAgLSBQcm86IG1hdGNoZXMgdGhlIGRvY3VtZW50ZWQgUFNDSSBPU0kgYXBw
cm9hY2guCj4gPiA+ICAgIC0gQ29uOiBXZSBkb24ndCBrbm93IGhvdyB0byBzZXQgdGhpcyBmbGFn
IHByb3Blcmx5IGluIGEgZ2VuZXJpYyB3YXkuCj4gPiA+ICAgICAgbGFzdF9hdF9wd3JsdmwgaXMg
b25seSBtZWFuaW5nZnVsIG9uIHJpc2N2L2FybSwgc28gd2UgY2FuJ3QganVzdAo+ID4gPiAgICAg
IGFkZCBpdCB0byBnZW5wZCdzIGdlbmVyaWMgY29kZSBwYXRoLiBnZW5wZCBhbHNvIGRvZXNuJ3Qg
a2VlcCBhCj4gPiA+ICAgICAgY291bnRlciBvZiBob3cgbWFueSBDUFVzIGluIGEgZG9tYWluIGFy
ZSBzdGlsbCBhbGl2ZSwgc28gdGhlcmUncwo+ID4gPiAgICAgIG5vIGV4aXN0aW5nIHN0YXRlIGlu
IGdlbnBkJ3MgcG93ZXJfb2ZmKCkgY2FsbGJhY2sgd2UgY291bGQgcmVhZAo+ID4gPiAgICAgIHRv
IGRlcml2ZSB0aGUgZmxhZy4gT25lIGlkZWEgd291bGQgYmUgdG8gd2FsayB0aGUgZ2VucGQgaGll
cmFyY2h5Cj4gPiA+ICAgICAgZnJvbSB3aXRoaW4gdGhlIHBvd2VyX29mZigpIGNhbGxiYWNrIGFu
ZCBjaGVjayB0aGUgcnVudGltZV9zdGF0dXMKPiA+ID4gICAgICBvZiBlYWNoIENQVSBkZXZpY2Ug
aW4gdGhlIHNhbWUgZG9tYWluIChnZW5wZCBkb21haW5zIGFscmVhZHkgY2FycnkKPiA+ID4gICAg
ICBhIENQVSBtYXNrLCBhbmQgZ2V0X2NwdV9kZXZpY2UoKSBjYW4gYmUgdXNlZCB0byBsb29rIHVw
IHRoZQo+ID4gPiAgICAgIGNvcnJlc3BvbmRpbmcgQ1BVIGRldmljZSkKPiA+ID4KPiA+ID4gMi4g
RG8gdGhlIHBvd2VyLWRvbWFpbiBjb250cm9sIGRpcmVjdGx5IGZyb20gdGhlIHBvd2VyX29mZigp
L3Bvd2VyX29uKCkKPiA+ID4gICAgZ2VucGQgY2FsbGJhY2tzIChlLmcuIGhhdmUgdGhlbSBwb2tl
IHRoZSBTb0MncyBwb3dlciBjb250cm9sbGVyCj4gPiA+ICAgIHJlZ2lzdGVycyB2aWEgYW4gU0JJ
IGNhbGwsIGluc3RlYWQgb2YgcmVseWluZyBvbiBlYWNoIENQVSdzIG93bgo+ID4gPiAgICBpZGxl
LWVudHJ5IHBhdGggdG8gdHJpZ2dlciB0aGUgZGVlcGVzdCBzdGF0ZSkuCj4gPiA+ICAgIGl0IGNy
ZWF0ZXMgdHdvIGluZGVwZW5kZW50IGRyaXZlciB0aGF0IHdpbGwgdG91Y2ggcG93ZXIgY29udHJv
bGxlcgo+ID4gPiAgICAob3BlbnNiaSB2cyBsaW51eCkKPiA+ID4KPiA+ID4gMy4gSGF2ZSBlYWNo
IENQVSBwYXNzIGEgbW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIHNlcXVlbmNlIG51bWJlcgo+ID4g
PiAgICBhbG9uZ3NpZGUgaXRzIHN1c3BlbmQgcmVxdWVzdCB0byBmaXJtd2FyZSwgYW5kIGhhdmUg
ZmlybXdhcmUKPiA+ID4gICAgaXRzZWxmIGRldGVjdCBhbmQgcmVqZWN0L2Rvd25ncmFkZSBhIGRl
ZXAgcG93ZXItZG93biByZXF1ZXN0IGlmIGEKPiA+ID4gICAgKm5ld2VyKiBzZXF1ZW5jZSBudW1i
ZXIgZnJvbSBhIHNoYWxsb3dlciAoaS5lLiAic29tZSBDUFUgYmVjYW1lCj4gPiA+ICAgIGFjdGl2
ZSBhZ2FpbiIpIHJlcXVlc3QgaGFzIGJlZW4gb2JzZXJ2ZWQgZm9yIHRoZSBzYW1lIGRvbWFpbiBz
aW5jZS4KPiA+ID4gICAgVGhpcyBpcyBhIGZpcm13YXJlLXNpZGUgc3RhbGVuZXNzIGNoZWNrLCBl
bnRpcmVseSBiZWxvdyB0aGUgU0JJCj4gPiA+ICAgIGNhbGwgYm91bmRhcnkKPiA+ID4gICAgdGhp
cyBzZXEgbnVtYmVyIGNhbiBiZSBtYWludGFpbmVkIGluIGdlbmRwZCBnZW5lcmljIGNvZGUKPiA+
ID4gICAgb3IgcmlzY3YgcG93ZXJfb2ZmKCkgY2FsbGJhY2ssIHdoZXJlIGRvIHlvdSBzdWdnZXN0
IHRoaXMgdG8gYmUKPiA+ID4gICAgYWRkZWQ/Cj4gPiA+Cj4gPiA+IERvIHlvdSBoYXZlIGFueSBz
dWdnZXN0aW9uIHRvIHNvbHZpbmcgdGhpcyBpc3N1ZT8KPiA+ID4gVGhhbmtzLAo+ID4gPiBKaW1t
eSBIbwo+Cj4gVGhlIHByb2JsZW0gc2VlbXMgdmVyeSBzaW1pbGFyIHRvIHRoZSByYWNlIGNvbmRp
dGlvbiB3ZSBoYXZlIGZvciB0aGUKPiBQU0NJIE9TSSBtb2RlLiBUaGlzIHJhY2UgY29uZGl0aW9u
IG5lZWRzIHRvIGJlIG1hbmFnZWQgaW4gdGhlIEZXLgo+Cj4gSWYgdGhlIGxhc3QgQ1BVIGluIGEg
Y2x1c3RlciBpcyBhYm91dCB0byBlbnRlciBpZGxlLCB0aGUgRlcgc2ltcGx5Cj4gbmVlZHMgdG8g
YWJvcnQgdGhlIHJlcXVlc3QgZm9yIGl0LCBpZiB0aGVyZSBpcyBhbm90aGVyIENQVSBpbiB0aGUg
c2FtZQo+IGNsdXN0ZXIgdGhhdCBpcyBhYm91dCB0byB3YWtlIHVwLgo+Cj4gS2luZCByZWdhcmRz
Cj4gVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
