Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6FBC00A5A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 05:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtI99e/SWnn5SJmqyv4yJMNSH65WgXPYhO9FNl8SaEo=; b=2tVc36oi7gEXYH
	t9KTi9tbV9pJewTTel8vQq3Lt6FPzDUrg4WZmKk1XSC0BAWCC+h0gawMR01jwyfpkMhk07RxiHFGm
	0rvf+H2al3mNT7ZFezY8o3+MArBB9XNEFIMRNDRrJ3vqcktPcg4E5mjwurGwWkSfXFQpE9hggKyGy
	TUXLgc95mq+rztRm61FG/saubgN/Hn55qJ2AdIjld5+HJ/mpAyk942ZvuctgZWsSdeLdJ/5oIbSHk
	4DQpVsJO0WkXBeZ0Y17Y5DtyVNxf6qRj4QHPeDQXz9453t6az8CCE2SjarcBel55FqGS6SsR/FbgE
	gFURJYzwoQxueYL9pYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINl3-003hC1-8k; Thu, 19 Jan 2023 05:46:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINkz-003hBI-Cx
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 05:46:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03D7361B8F
	for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 05:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48DBC433AA
	for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 05:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674107194;
	bh=PUo5jPPjJrkM2h7J25vyMD/6YvyXua6eq5cySfeUnL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h9MU5Y5VA+Q7j9Bsqr41zeeMkXazs3w6TjEdm17vnSzmGII7qU6UIkQzWpKmeXomw
	 fsNh0Pvkq1cMhKoSSrouRJmj0iqEHaCZQwj8DYc2RpmQ3pQAmAUbNoTRYR6o0BndTX
	 Ms7eBXMjzyzk7g8GnJguA5tqklPd2/Dg4cE/k1Zijh+WB3+FxnCazG4D/nYrxmB3Xp
	 HAxVoX0IkvT9soSbfQpnLz4AXV0UYqDIvBxcExRmNcRom8JlnCVS/FfEvLeQM2Lu7d
	 RQO3cXxeBWgWiWbxTVqeqFLvzppzscGL4A9mSpYme76qW2P6Ct/PTFzsYKH0Gj1Ci7
	 Sf0RMpeigvaIg==
Received: by mail-ej1-f53.google.com with SMTP id ss4so2803434ejb.11
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 21:46:34 -0800 (PST)
X-Gm-Message-State: AFqh2krmNtxjJS5KJma1FickwInMqMYus1i0XVGjEndJbZFEZgQ+3svK
	946TjwUpoqxeTKQ2bInXWFCT0YZbBFztt2RsRIg=
X-Google-Smtp-Source: AMrXdXtTkjuLHW4UxR7ePpJ7YJ6QSALj/QyWmF+W0YzL6aodh8EK5LwiLXp4/6FXD/LPZuO++sEd9tICg/hWMKYDuoU=
X-Received: by 2002:a17:906:2b13:b0:84d:378a:6a83 with SMTP id
 a19-20020a1709062b1300b0084d378a6a83mr647668ejg.472.1674107192862; Wed, 18
 Jan 2023 21:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20230112095848.1464404-1-guoren@kernel.org> <20230112095848.1464404-5-guoren@kernel.org>
 <Y8EjAt3DC4WC062n@wendy>
In-Reply-To: <Y8EjAt3DC4WC062n@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 19 Jan 2023 13:46:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTXtkCnv4vHXS1H=L=gbbVd1wyijteq7WjgC4KiSPuHfw@mail.gmail.com>
Message-ID: <CAJF2gTTXtkCnv4vHXS1H=L=gbbVd1wyijteq7WjgC4KiSPuHfw@mail.gmail.com>
Subject: Re: [PATCH -next V14 4/7] riscv: entry: Convert to generic entry
To: Conor Dooley <conor.dooley@microchip.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com, 
	ben@decadent.org.uk, bjorn@kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yipeng Zou <zouyipeng@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_214637_556860_4DF31605 
X-CRM114-Status: GOOD (  20.69  )
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

VGh4LCBJIGdvdCB0aGF0OgoKICBMRCAgICAgIHZtbGludXgKcmlzY3Y2NC11bmtub3duLWxpbnV4
LWdudS1sZDogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMubzogaW4gZnVuY3Rpb24KYGRvX3RyYXBf
ZWNhbGxfdSc6Ci9ob21lL2d1b3Jlbi9zb3VyY2Uva2VybmVsL2xpbnV4L2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmM6MjQ1Ogp1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBoYW5kbGVfcGFnZV9mYXVs
dCcKbWFrZVsyXTogKioqIFsvaG9tZS9ndW9yZW4vc291cmNlL2tlcm5lbC9saW51eC9zY3JpcHRz
L01ha2VmaWxlLnZtbGludXg6MzQ6CnZtbGludXhdIEVycm9yIDEKbWFrZVsxXTogKioqIFsvaG9t
ZS9ndW9yZW4vc291cmNlL2tlcm5lbC9saW51eC9NYWtlZmlsZToxMjUyOiB2bWxpbnV4XSBFcnJv
ciAyCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9ndW9yZW4vc291cmNlL2tlcm5l
bC9idWlsZC1ub21tdScKbWFrZTogKioqIFtNYWtlZmlsZToyNDI6IF9fc3ViLW1ha2VdIEVycm9y
IDIKClNvcnJ5LgoKQW5kIGhlcmUgaXMgdGhlIGZpeHVwOgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDBiNzY0
MDcxZGU4Yy4uNjlkNjE5ZGRiY2Q1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTI2OCw2ICsyNjgsNyBAQCBh
c21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkCmRvX3RyYXBfZWNhbGxfdShz
dHJ1Y3QgcHRfcmVncyAqcmVncykKCiB9CgorI2lmZGVmIENPTkZJR19NTVUKIGFzbWxpbmthZ2Ug
X192aXNpYmxlIG5vaW5zdHIgdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdz
KQogewogICAgICAgIGlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRlcihyZWdz
KTsKQEAgLTI3OCw2ICsyNzksNyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBub2luc3RyIHZvaWQK
ZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykKCiAgICAgICAgaXJxZW50cnlfZXhp
dChyZWdzLCBzdGF0ZSk7CiB9CisjZW5kaWYKCiBhc21saW5rYWdlIF9fdmlzaWJsZSBub2luc3Ry
IHZvaWQgZG9faXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogewoKT24gRnJpLCBKYW4gMTMsIDIw
MjMgYXQgNToyMyBQTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3
cm90ZToKPgo+IEhleSBHdW8gUmVuLAo+Cj4gT24gVGh1LCBKYW4gMTIsIDIwMjMgYXQgMDQ6NTg6
NDVBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhpcyBwYXRjaCBjb252ZXJ0cyByaXNj
diB0byB1c2UgdGhlIGdlbmVyaWMgZW50cnkgaW5mcmFzdHJ1Y3R1cmUgZnJvbQo+ID4ga2VybmVs
L2VudHJ5LyouIFRoZSBnZW5lcmljIGVudHJ5IG1ha2VzIG1haW50YWluZXJzJyB3b3JrIGVhc2ll
ciBhbmQKPiA+IGNvZGVzIG1vcmUgZWxlZ2FudC4gSGVyZSBhcmUgdGhlIGNoYW5nZXM6Cj4gPgo+
ID4gIC0gTW9yZSBjbGVhciBlbnRyeS5TIHdpdGggaGFuZGxlX2V4Y2VwdGlvbiBhbmQgcmV0X2Zy
b21fZXhjZXB0aW9uCj4gPiAgLSBHZXQgcmlkIG9mIGNvbXBsZXggY3VzdG9tIHNpZ25hbCBpbXBs
ZW1lbnRhdGlvbgo+ID4gIC0gTW92ZSBzeXNjYWxsIHByb2NlZHVyZSBmcm9tIGFzc2VtYmx5IHRv
IEMsIHdoaWNoIGlzIG11Y2ggbW9yZQo+ID4gICAgcmVhZGFibGUuCj4gPiAgLSBDb25uZWN0IHJl
dF9mcm9tX2ZvcmsgJiByZXRfZnJvbV9rZXJuZWxfdGhyZWFkIHRvIGdlbmVyaWMgZW50cnkuCj4g
PiAgLSBXcmFwIHdpdGggaXJxZW50cnlfZW50ZXIvZXhpdCBhbmQgc3lzY2FsbF9lbnRlci9leGl0
X2Zyb21fdXNlcl9tb2RlCj4gPiAgLSBVc2UgdGhlIHN0YW5kYXJkIHByZWVtcHRpb24gY29kZSBp
bnN0ZWFkIG9mIGN1c3RvbQo+ID4KPiA+IFN1Z2dlc3RlZC1ieTogSHVhY2FpIENoZW4gPGNoZW5o
dWFjYWlAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4gPiBUZXN0ZWQtYnk6IFlpcGVuZyBab3UgPHpvdXlpcGVuZ0BodWF3ZWku
Y29tPgo+ID4gVGVzdGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IENjOiBCZW4gSHV0
Y2hpbmdzIDxiZW5AZGVjYWRlbnQub3JnLnVrPgo+Cj4gVW5mb3J0dW5hdGVseSBmcm9tIHRoaXMg
cGF0Y2ggb253YXJkcywgdGhlICFNTVUgYnVpbGQgaXMgYnJva2VuLgo+IFNob3VsZCBiZSBhYmxl
IHRvIHJlcHJvZHVjZSBpdCB3aXRoIG5vbW11X3ZpcnRfZGVmY29uZmlnLgo+Cj4gVGhhbmtzLAo+
IENvbm9yLgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
