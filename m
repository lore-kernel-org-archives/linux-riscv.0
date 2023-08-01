Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB750C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bs3SBWbXv3m1BERLWTCGvOCceTsX++3wyxHMe722giE=; b=V5p/dWeQLyYr3J
	IMwbVWh4T9SA685zl2z/q4incC3ltmg4S8ZDev7bfb/MmHr+E7pUmdJmdm8902I3jdRGemluAV/qS
	UPiCEtZWc8lVsTQwFMGZU1FOgv/BpVWiRZEhh0WbkOiLFKW1ZnhfCPDf5vguS0+RQl4EqYFuV0SFR
	VmlW9pXlSCInIMm26O/yDoACLObHJw6Kh9elifiOVunXtRMczJ4ZjrWTTrRTGh/0NwVDH8sJNEXSy
	+V0tCwfe9BQPwfLj8I79AL6wYVHSyFa7JcrSjEv+YHGUMcNuvlEXa2/+8UCkHqukNx6fMSHsSViEP
	SFt1E4B9Z0DL887BjSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoW9-002LtH-2l;
	Tue, 01 Aug 2023 12:30:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo8Q-002CPV-0n
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 12:05:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so51512185e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690891551; x=1691496351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYXM+viaYKXI3b2wBLalCMMxAL01quBkoWhoIA0YF7E=;
        b=DVylIM1I4qmIQVgui57WAhQLG9WX/L8udh/CvxU77UjUGp5ZUYaPkp2AzvHyo9eLDD
         fO5k/E04LtA4rXG+elH9RQzkSLsfbvAXt8Ucq6eohDvaSkFBPjVbZV3JD3KjUbFWj09/
         HOi4+h4bWR+eB4ywps2Kplp2xbsHn9PfAtK8B0G5lU6oeZf7FJCZ1MwxwGOLuAtJ86fK
         Y2TqsqJfbJKtYJAPyzNBF/7xZG33EWObqREn5oYkDrDf7Q3Vlgx8JqawJNUGLaiygoV1
         zhvUiy0w1pP+/OOAsv5WpM13HCrbqktrP30BYSsAAh/XhCj2ZHJeTCTjuS1KDGqHQQsa
         YWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690891551; x=1691496351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYXM+viaYKXI3b2wBLalCMMxAL01quBkoWhoIA0YF7E=;
        b=idcpgLQZNNDbjmOcNsH1SQRE2Bb/SBVhcTv0C6QNPw9Y9XzyhLCQv3zQNZ1BlXQ6P4
         r5sb98ory00yDFCdkiKzKX4n1Z11gDEpGmKlfXAXFGWvw2XPXKC2TDTmq4qcUZ/6uJok
         fomCfCn3tQDrIWspUvxJZz8ecuG7ZAmSf//336ty/0Toioy9ee80kD+5J4al1ShBzW4j
         8kcIVw7y/RdtthK6Ub2soN4sLN31Teu/DQWQWSflKvSkPGvW9XLmEngAx9upyBJDIxBE
         FSd5zSuEWf+do2T5ZoQOodrLq+W02BlEklTUurCxjM8Ws1GLBT+ip4USCmlOmomBx/kG
         2oNw==
X-Gm-Message-State: ABy/qLbMHOmA1aOdWHBbUXd2ktqzyof4CqRFM19HFRJqdNnelRTcSTcw
	Q6HLoqrhgIq3HsXOrrEuHLRGr3+gQXo0zlZl3YISjQ==
X-Google-Smtp-Source: APBJJlE93xXtEN+UjaHzDpCW3afIyCrZL42w1EbToTukkXUi0VJMMFB0bE6AJHzpRTDyiovJEP3b/kNlH8CNaMchrpg=
X-Received: by 2002:adf:fc88:0:b0:316:e249:c285 with SMTP id
 g8-20020adffc88000000b00316e249c285mr1958220wrr.71.1690891550325; Tue, 01 Aug
 2023 05:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230801111014.1432679-1-suagrfillet@gmail.com>
In-Reply-To: <20230801111014.1432679-1-suagrfillet@gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 1 Aug 2023 14:05:39 +0200
Message-ID: <CAHVXubgv1xmH7ZF9WsBQ=hYYk1PpKH5PUmYnSH1QTU-Jg1=xOA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Correct the MODULES_VADDR
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	akpm@linux-foundation.org, guoren@kernel.org, 
	sergey.matyukevich@syntacore.com, david@redhat.com, 
	wangkefeng.wang@huawei.com, panqinglin2020@iscas.ac.cn, 
	woodrow.shen@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_050554_469353_EA32AFFD 
X-CRM114-Status: GOOD (  18.34  )
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

SGkgU29uZywKCk9uIFR1ZSwgQXVnIDEsIDIwMjMgYXQgMToxMOKAr1BNIFNvbmcgU2h1YWkgPHN1
YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBcyBEb2N1bWVudGF0aW9uL3Jpc2N2L3Zt
LWxheW91dC5yc3QgZGVzY3JpYmVzLCB0aGUgMkctc2l6ZWQgIm1vZHVsZXMsIEJQRiIKPiBhcmVh
IHNob3VsZCBsaWUgcmlnaHQgYmVmb3JlIHRoZSAia2VybmVsIiBhcmVhLiBCdXQgdGhlIGN1cnJl
bnQgZGVmaW5pdGlvbgo+IG9mIE1PRFVMRVNfVkFERFIgaXNuJ3QgY29uc2lzdGVudCB3aXRoIHRo
YXQsIHNvIGNvcnJlY3QgaXQuCj4KPiBCZWZvcmUgdGhpcyBwYXRjaCwgdGhlIHNpemUgb2YgIm1v
ZHVsZXMiIGZyb20gcHJpbnRfdm1fbGF5b3V0KCkgaXMgbm90IDJHLgo+Cj4gWyAgICAwLjAwMDAw
MF0gICAgICBtb2R1bGVzIDogMHhmZmZmZmZmZjJmZjJmMDAwIC0gMHhmZmZmZmZmZmFlNjAwMDAw
ICgyMDIyIE1CKQo+IFsgICAgMC4wMDAwMDBdICAgICAgIGxvd21lbSA6IDB4ZmY2MDAwMDAwMDAw
MDAwMCAtIDB4ZmY2MDAwMDA0MDAwMDAwMCAoMTAyNCBNQikKPiBbICAgIDAuMDAwMDAwXSAgICAg
ICBrZXJuZWwgOiAweGZmZmZmZmZmYWU2MDAwMDAgLSAweGZmZmZmZmZmZmZmZmZmZmYgKDEzMDUg
TUIpCj4KPiBBZnRlciB0aGlzIHBhdGNoLCB0aGUgc2l6ZSBpcyAyRy4KPgo+IFsgICAgMC4wMDAw
MDBdICAgICAgbW9kdWxlcyA6IDB4ZmZmZmZmZmYzYTAwMDAwMCAtIDB4ZmZmZmZmZmZiYTAwMDAw
MCAoMjA0OCBNQikKPiBbICAgIDAuMDAwMDAwXSAgICAgICBsb3dtZW0gOiAweGZmNjAwMDAwMDAw
MDAwMDAgLSAweGZmNjAwMDAwNDAwMDAwMDAgKDEwMjQgTUIpCj4gWyAgICAwLjAwMDAwMF0gICAg
ICAga2VybmVsIDogMHhmZmZmZmZmZmJhMDAwMDAwIC0gMHhmZmZmZmZmZmZmZmZmZmZmICgxMTE5
IE1CKQo+Cj4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAo+IGluZGV4IDc1OTcwZWUyYmRhMi4uN2M1N2UxN2ZjNzU4IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBAQCAtNTMsOCArNTMsOCBAQAo+ICAjaWZkZWYgQ09O
RklHXzY0QklUCj4gIC8qIFRoaXMgaXMgdXNlZCB0byBkZWZpbmUgdGhlIGVuZCBvZiB0aGUgS0FT
QU4gc2hhZG93IHJlZ2lvbiAqLwo+ICAjZGVmaW5lIE1PRFVMRVNfTE9XRVNUX1ZBRERSICAgKEtF
Uk5FTF9MSU5LX0FERFIgLSBTWl8yRykKPiAtI2RlZmluZSBNT0RVTEVTX1ZBRERSICAgICAgICAg
IChQRk5fQUxJR04oKHVuc2lnbmVkIGxvbmcpJl9lbmQpIC0gU1pfMkcpCj4gICNkZWZpbmUgTU9E
VUxFU19FTkQgICAgICAgICAgICAoUEZOX0FMSUdOKCh1bnNpZ25lZCBsb25nKSZfc3RhcnQpKQo+
ICsjZGVmaW5lIE1PRFVMRVNfVkFERFIgICAgICAgICAgKE1PRFVMRVNfRU5EIC0gU1pfMkcpCj4g
ICNlbmRpZgo+Cj4gIC8qCj4gLS0KPiAyLjIwLjEKPgoKVGhlIGRvY3VtZW50YXRpb24gaXMgYXBw
cm94aW1hdGl2ZSwgdGhlIG1vZHVsZXMgbXVzdCBzdGF5IHdpdGhpbiBhIDJHQgp3aW5kb3cgdG8g
KmFsbCogdGhlIGtlcm5lbCBzeW1ib2xzLCBoZW5jZSB0aGUgX19lbmQgLSAyRywgbm90IF9fc3Rh
cnQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
