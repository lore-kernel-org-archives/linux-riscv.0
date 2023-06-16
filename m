Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474F7EB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8adzYSHKJmkwkVThfDR8vX/dm/JN/hXQ6G08cLKSnvs=; b=GaafCCefFdAhs4
	d09pypW/u4irgcvPqh3wOeYEW0nqPKWsX4yAXgmUwaC7Hpd8q4DZZDkjlZ0nGXBJFT8t2PS3ugsiY
	eIWsIsC3Nx8C8oUrtwoprfsie2XMhb3bokCcGq9Yn3LuWRZbu5B1zrdFjMmisaPA6lZwqiskfULlg
	vK+AenzMMfvms7ByzRMo03HspOyGzTiQRQitCmL+o6x9rzQgjfHGInqjRPARcQGpY2VRyvwdGrFGo
	6h8W2EZ7/xlSqAsykPc5uQwaF+idfT1v/A6zxJoin96NsFq78M7mDkl3eb5y4fnSzq8YOha60Zcno
	7rL2iHADr7RZP+c4VVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5Px-00HPcg-31;
	Fri, 16 Jun 2023 09:06:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5Pu-00HPao-1s
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 09:06:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f7378a75c0so3186175e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686906408; x=1689498408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOWt+C9wEbLfjqdZhINVftMFCjAyDqGa14a9jKJ2WVI=;
        b=G6ROQg++vHQw4V3AtetwK7l7I5esMSVoruTnh8EyN/ijS6Re627CdPP8YQcXToUru9
         iuqVdpH0b4lB44E9kOAOyVyBF/2xAk95vDbiu5xBjuHfnNjC23zAuSx2Eb1+RW6cHgiF
         9JtSG8Hp2cjJedaPfxojke6Bh6ve5fzpoRRVyNSaFmCUCoAIqaBsUTowv+WSRdQ8QqSR
         WeGBcYRpT4TSKUHD2UFGtrItMtVfjY73IJPhIqWiCeMtVpL0zdDBsrD9gnlu5mocCoUw
         dQXQLwbcxBbNok8aNe9hogrAcK/TOVuBxW6ywxaUOjFDfvVx1Q1TPmNqxncB+BEgdrJq
         TlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686906408; x=1689498408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOWt+C9wEbLfjqdZhINVftMFCjAyDqGa14a9jKJ2WVI=;
        b=ggZ2SP4hyhDsFtgsjbk8YL6nV4ICvmDKqISGTCdgtV5FqfXGPzTKFRwLB/vmdiaeI6
         umq3O7Y4jYN2NI8OWRX2rH6TDuc5AzoGdKMGu8J8vl2GK0egynaWeKQ8DBbL+SScDBXe
         bTN6NydikF7zLYkvzutOuKJwD1La1dgasOUNtryBZx6yIPhWvVywVD3UV3Va/xqn17qH
         DCABe7vUiUZE1w1oEN0DBxtGibsIhh/HYb0J5taakAroi/JJUPko8vI5scd5cU4oBlo6
         qZKVAq/PAIP+O3jQ6K7YZESBgNpcTOyw3KTchhqhssaaEuyxd10OhmI+a7RXaNqJnmQO
         Wlqw==
X-Gm-Message-State: AC+VfDxOfj6da4WgRXH4qkt/AAcDhd/EllI2LorgFDE5lLO0vdYTSWcq
	QYMnQrIko7WYlialAEKNhjJZf+3isWgQ/Zp2k/Thrw==
X-Google-Smtp-Source: ACHHUZ6yG3gf4Y6nAcZIL+5rY4JrqDkcntRqtoN/pU/vG2fH73sWA4VKxmw9Z3uL8QL75OuCCXdqoVlqQndqO/kfeKU=
X-Received: by 2002:a5d:44cf:0:b0:310:4fa3:5b0f with SMTP id
 z15-20020a5d44cf000000b003104fa35b0fmr626635wrr.69.1686906408314; Fri, 16 Jun
 2023 02:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-10-alexghiti@rivosinc.com> <CAOnJCU+n0O9oQmd1Vs3kimaBai7vbaf5RiMRFyvphCCLCGMB1A@mail.gmail.com>
In-Reply-To: <CAOnJCU+n0O9oQmd1Vs3kimaBai7vbaf5RiMRFyvphCCLCGMB1A@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 16 Jun 2023 11:06:37 +0200
Message-ID: <CAHVXubgGqRLN3cb=eEW8zXHto6ZqJGg4LoFi=rEnuBCztYtV=w@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] tools: lib: perf: Implement riscv mmap support
To: Atish Patra <atishp@atishpatra.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_020650_617163_83F8941C 
X-CRM114-Status: GOOD (  21.85  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTA6NDPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0
aXNocGF0cmEub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDEyLCAyMDIzIGF0IDI6MDPigK9B
TSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+
IHJpc2N2IG5vdyBzdXBwb3J0IG1tYXBpbmcgaGFyZHdhcmUgY291bnRlcnMgc28gYWRkIHdoYXQn
cyBuZWVkZWQgdG8KPiA+IHRha2UgYWR2YW50YWdlIG9mIHRoYXQgaW4gbGlicGVyZi4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
Cj4gPiAtLS0KPiA+ICB0b29scy9saWIvcGVyZi9tbWFwLmMgfCA2NSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGliL3BlcmYvbW1hcC5jIGIvdG9v
bHMvbGliL3BlcmYvbW1hcC5jCj4gPiBpbmRleCAwZDE2MzRjZWRmNDQuLjY1ZjI1MGUwZWY5MiAx
MDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ID4gKysrIGIvdG9vbHMvbGli
L3BlcmYvbW1hcC5jCj4gPiBAQCAtMzkyLDYgKzM5Miw3MSBAQCBzdGF0aWMgdTY0IHJlYWRfcGVy
Zl9jb3VudGVyKHVuc2lnbmVkIGludCBjb3VudGVyKQo+ID4KPiA+ICBzdGF0aWMgdTY0IHJlYWRf
dGltZXN0YW1wKHZvaWQpIHsgcmV0dXJuIHJlYWRfc3lzcmVnKGNudHZjdF9lbDApOyB9Cj4gPgo+
ID4gKyNlbGlmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ID4gKwo+Cj4gVGhpcyBpcyBhcHBsaWNhYmxl
IGZvciBSVjMyIGFzIHdlbGwuIE5vID8KPiBvdGhlcndpc2UsIHlvdSB3b24ndCBuZWVkIENTUl9D
WUNMRUgKCkFkbWl0dGVkbHksIEkgaGF2ZSBub3QgY2hlY2tlZCBydjMyIGF0IGFsbCBpbiB0aGlz
IHNlcmllcyBhbmQgdGhlIGNvZGUKYmVsb3cgaXMgYSBjb3B5LXBhc3RlLiBJJ2Qgc2F5IHRoYXQg
cnYzMiBzdXBwb3J0IGlzIG91dCBvZiBzY29wZSBmb3IKdGhpcyBzZXJpZXMsIGlzIHRoYXQgb2sg
d2l0aCB5b3U/Cgo+Cj4gPiArI2RlZmluZSBDU1JfQ1lDTEUgICAgICAweGMwMAo+ID4gKyNkZWZp
bmUgQ1NSX1RJTUUgICAgICAgMHhjMDEKPiA+ICsjZGVmaW5lIENTUl9DWUNMRUggICAgIDB4Yzgw
Cj4gPiArCj4gPiArI2RlZmluZSBjc3JfcmVhZChjc3IpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgcmVnaXN0ZXIgdW5z
aWduZWQgbG9uZyBfX3Y7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAg
ICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJjc3JyICUwLCAiICNjc3IgICAgICAgICAg
XAo+ID4gKyAgICAgICAgICAgICAgICA6ICI9ciIgKF9fdikgOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgIF9fdjsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gK30pCj4gPiArCj4g
PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgY3NyX3JlYWRfbnVtKGludCBjc3JfbnVtKQo+ID4gK3sK
PiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAg
ICAgIHtcCj4gPiArICAgICAgIGNhc2UgX19jc3JfbnVtOiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICBfX3ZhbCA9IGNzcl9yZWFkKF9fY3NyX251
bSk7ICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOyB9Cj4gPiArI2RlZmlu
ZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ID4g
KyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgICAg
XAo+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSArIDEsIF9fdmFsKX0K
PiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0sIF9fdmFsKSAgICAg
ICAgIHtcCj4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0gKyAwLCBf
X3ZhbCkgICAgICBcCj4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0g
KyAyLCBfX3ZhbCl9Cj4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVt
LCBfX3ZhbCkgICAgICAgICB7XAo+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQoX19j
c3JfbnVtICsgMCwgX192YWwpICAgICAgXAo+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFk
XzQoX19jc3JfbnVtICsgNCwgX192YWwpfQo+ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVh
ZF8xNihfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAge1wKPiA+ICsgICAgICAgc3dpdGNoY2FzZV9j
c3JfcmVhZF84KF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgIFwKPiA+ICsgICAgICAgc3dpdGNo
Y2FzZV9jc3JfcmVhZF84KF9fY3NyX251bSArIDgsIF9fdmFsKX0KPiA+ICsjZGVmaW5lIHN3aXRj
aGNhc2VfY3NyX3JlYWRfMzIoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgIHtcCj4gPiArICAgICAg
IHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtICsgMCwgX192YWwpICAgICBcCj4gPiAr
ICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtICsgMTYsIF9fdmFsKX0KPiA+
ICsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyByZXQgPSAwOwo+ID4gKwo+ID4gKyAgICAgICBz
d2l0Y2ggKGNzcl9udW0pIHsKPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8zMihDU1Jf
Q1lDTEUsIHJldCkKPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8zMihDU1JfQ1lDTEVI
LCByZXQpCj4gPiArICAgICAgIGRlZmF1bHQ6Cj4gPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4g
PiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIHJldDsKPiA+ICsjdW5kZWYgc3dp
dGNoY2FzZV9jc3JfcmVhZF8zMgo+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2Cj4g
PiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfOAo+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nz
cl9yZWFkXzQKPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF8yCj4gPiArI3VuZGVmIHN3
aXRjaGNhc2VfY3NyX3JlYWQKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHU2NCByZWFkX3BlcmZf
Y291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlcikKPiA+ICt7Cj4gPiArICAgICAgIHJldHVybiBj
c3JfcmVhZF9udW0oQ1NSX0NZQ0xFICsgY291bnRlcik7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRp
YyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkKPiA+ICt7Cj4gPiArICAgICAgIHJldHVybiBjc3Jf
cmVhZF9udW0oQ1NSX1RJTUUpOwo+ID4gK30KPiA+ICsKPiA+ICAjZWxzZQo+ID4gIHN0YXRpYyB1
NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIgX19tYXliZV91bnVzZWQp
IHsgcmV0dXJuIDA7IH0KPiA+ICBzdGF0aWMgdTY0IHJlYWRfdGltZXN0YW1wKHZvaWQpIHsgcmV0
dXJuIDA7IH0KPiA+IC0tCj4gPiAyLjM3LjIKPiA+Cj4KPgo+IC0tCj4gUmVnYXJkcywKPiBBdGlz
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
