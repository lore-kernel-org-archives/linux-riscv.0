Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9DEC35274
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 01:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NSfTi+STvXyk4ZM+n+vrPsKF2l1/X8+DFi35yff+us=; b=lusWqrmoqzFPL3
	PSmvHP2vwOiW+VanCvwHr/iQ1XgWbn6caCkYfVmGmUB9D+G/TgFZkd0F8HXcp327lXBoaBUwpJN8S
	65vz6tet7kdyV24fmfkhMTj5OHOtuvcnTEM7jJXt7Um7fHJu2N1WT9I+RdmkfOTdpoCD4gHXSBH7k
	mbzhyCXfAVygkSSAhTPmcu+HB39vFJ6qC8lOcJhbqGMpOhM9bo1hJ+e7riY3C9k3T7yM3QDE/4ujk
	24SByuIhY0LpczyGi1zxVI0J0o5EGZgLjj/9Ttr582e23pJ91J4pqZZs28ugcdfys9VrVZRK2QCMT
	zhT7AQPuL2quSPblx4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPBg-00CWQq-0t;
	Tue, 19 Dec 2023 01:46:24 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPBd-00CWPy-38
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 01:46:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso4523547e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 17:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702950379; x=1703555179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUM/d5YEXMN7h3iJw/LF6wzvQMD8RKrNFiOD59rIiqs=;
        b=NeajlTOmP1BjM+1Zr71O0PWp8nRH2yCXO4S+PKsHB1zAs9Jj4nQtMUdE9EwIub6mZv
         U+ioeiu7w4nfnH6ZVyciQlevCVsgTIZrCSAyPW4vSR1eyU5VJ7HYSRiAGmkRWvoRWoE9
         pq18hyo9bfsM4cbUjSEj3ZnGWar/89geq+I5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950379; x=1703555179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUM/d5YEXMN7h3iJw/LF6wzvQMD8RKrNFiOD59rIiqs=;
        b=cFsooMpD4M82sjbHnC+FmL4Ebus3yjn9ur2geTxgGTc4yNsxAdIkNNw9JFbkvWj4ui
         SGKTQOuMkFlm33VSaDWvQz2DjI4tu1U8TbjZXKtw/nHR4V0AD6BAlXn6BX8Hw2WXkPHm
         DiCaBfxWtHfenGiYonDE/RUftBy+vRjZej72Zf8VFKtaXf4elduvloHh3aAa2dWCia6z
         /7y7fBYX/yfd9C+Xc8keRHChJWAnrwLAfg66tKLCWmKHN7dH6J8MUqf/PZDP/wr5dUl5
         RFl0oW9T9zfjTASqSFqVbt0X7UXUqahU4Qw1EpsEL53KoO0qxPWl0bfttmHaqoAF6zUp
         ZvJA==
X-Gm-Message-State: AOJu0YzAY4A+nZxCKlRua9JwbUwHbjIj8hfgV2rTPhvZyp6SEeUxaTH1
	T9bfiDQeES27qVVfEsdTEnopjfOcNyaRDMxjaw8q
X-Google-Smtp-Source: AGHT+IG9OPczqbtbKBh9wdJXjP5g18U9WG0KvN+wDryDNyFx2mZvZFlGjalfwzenwSYw63RdwqBcYVcYoxGLYIClXrU=
X-Received: by 2002:a05:6512:3f09:b0:50b:f2ea:5454 with SMTP id
 y9-20020a0565123f0900b0050bf2ea5454mr5395285lfa.118.1702950379327; Mon, 18
 Dec 2023 17:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20231217204019.36492-15-ajones@ventanamicro.com> <20231217204019.36492-20-ajones@ventanamicro.com>
In-Reply-To: <20231217204019.36492-20-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 18 Dec 2023 17:46:08 -0800
Message-ID: <CAOnJCUL5a_Kb1=9esM1qxXpSg2n03mWAahm3z1T3tCe1RdDtqA@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] RISC-V: KVM: Add steal-update vcpu request
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_174622_009211_D648A5CE 
X-CRM114-Status: GOOD (  19.15  )
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

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFkZCBhIG5ldyB2Y3B1IHJlcXVlc3QgdG8gaW5m
b3JtIGEgdmNwdSB0aGF0IGl0IHNob3VsZCByZWNvcmQgaXRzCj4gc3RlYWwtdGltZSBpbmZvcm1h
dGlvbi4gVGhlIHJlcXVlc3QgaXMgbWFkZSBlYWNoIHRpbWUgaXQgaGFzIGJlZW4KPiBkZXRlY3Rl
ZCB0aGF0IHRoZSB2Y3B1IHRhc2sgd2FzIG5vdCBhc3NpZ25lZCBhIGNwdSBmb3Igc29tZSB0aW1l
LAo+IHdoaWNoIGlzIGVhc3kgdG8gZG8gYnkgbWFraW5nIHRoZSByZXF1ZXN0IGZyb20gdmNwdS1s
b2FkLiBUaGUgcmVjb3JkCj4gZnVuY3Rpb24gaXMganVzdCBhIHN0dWIgZm9yIG5vdyBhbmQgd2ls
bCBiZSBmaWxsZWQgaW4gd2l0aCB0aGUgcmVzdAo+IG9mIHRoZSBzdGVhbC10aW1lIHN1cHBvcnQg
ZnVuY3Rpb25zIGluIGZvbGxvd2luZyBwYXRjaGVzLgo+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxh
am9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oIHwgMyArKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgIHwg
NSArKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyAgICAgfCA0ICsrKysKPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oCj4gaW5kZXggMGVlZmQ5Yzk5MWFlLi4yMzBiODJjMzExOGQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4gQEAgLTQxLDYgKzQxLDcgQEAKPiAgICAgICAgIEtWTV9BUkNI
X1JFUV9GTEFHUyg0LCBLVk1fUkVRVUVTVF9XQUlUIHwgS1ZNX1JFUVVFU1RfTk9fV0FLRVVQKQo+
ICAjZGVmaW5lIEtWTV9SRVFfSEZFTkNFICAgICAgICAgICAgICAgICBcCj4gICAgICAgICBLVk1f
QVJDSF9SRVFfRkxBR1MoNSwgS1ZNX1JFUVVFU1RfV0FJVCB8IEtWTV9SRVFVRVNUX05PX1dBS0VV
UCkKPiArI2RlZmluZSBLVk1fUkVRX1NURUFMX1VQREFURSAgICAgICAgICAgS1ZNX0FSQ0hfUkVR
KDYpCj4KPiAgZW51bSBrdm1fcmlzY3ZfaGZlbmNlX3R5cGUgewo+ICAgICAgICAgS1ZNX1JJU0NW
X0hGRU5DRV9VTktOT1dOID0gMCwKPiBAQCAtMzcyLDQgKzM3Myw2IEBAIGJvb2wga3ZtX3Jpc2N2
X3ZjcHVfaGFzX2ludGVycnVwdHMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1NjQgbWFzayk7Cj4g
IHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcG93ZXJfb2ZmKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4g
IHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcG93ZXJfb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPgo+
ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1lKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7Cj4gKwo+ICAjZW5kaWYgLyogX19SSVNDVl9LVk1fSE9TVF9IX18gKi8KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5k
ZXggYmYzOTUyZDFhNjIxLi42OTk1YjhiNjQxZTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTU0MSw2ICs1NDEs
OCBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBj
cHUpCj4KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X2FpYV9sb2FkKHZjcHUsIGNwdSk7Cj4KPiAr
ICAgICAgIGt2bV9tYWtlX3JlcXVlc3QoS1ZNX1JFUV9TVEVBTF9VUERBVEUsIHZjcHUpOwo+ICsK
PiAgICAgICAgIHZjcHUtPmNwdSA9IGNwdTsKPiAgfQo+Cj4gQEAgLTYxNCw2ICs2MTYsOSBAQCBz
dGF0aWMgdm9pZCBrdm1fcmlzY3ZfY2hlY2tfdmNwdV9yZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCj4KPiAgICAgICAgICAgICAgICAgaWYgKGt2bV9jaGVja19yZXF1ZXN0KEtWTV9SRVFf
SEZFTkNFLCB2Y3B1KSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfaGZlbmNl
X3Byb2Nlc3ModmNwdSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtX2NoZWNrX3JlcXVl
c3QoS1ZNX1JFUV9TVEVBTF9VUERBVEUsIHZjcHUpKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1lKHZjcHUpOwo+ICAgICAgICAgfQo+ICB9
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IGluZGV4IDgzOTkxMWRjZDgzNy4uZTI4MzUxYzk0ODhi
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiBAQCAtOCw2ICs4LDEwIEBACj4gICNpbmNsdWRl
IDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4KPiArdm9pZCBr
dm1fcmlzY3ZfdmNwdV9yZWNvcmRfc3RlYWxfdGltZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4g
K3sKPiArfQo+ICsKPiAgc3RhdGljIGludCBrdm1fc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1l
bShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgICAgICAgIHJldHVybiBTQklfRVJSX0ZB
SUxVUkU7Cj4gLS0KPiAyLjQzLjAKPgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
