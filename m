Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEDBC77B7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUo+9VzSm+/Q3eu5kahSHrRo5eNBn2tQ6I+N3I6gDrw=; b=MrCqvBCLbPNteJ
	ZvTghzPYE89JOx2h941IFVTGTmmgEankXU1+BrQ917jRd1WNW/qsvApzGAnpGV5X/7A88NcvUrIa9
	mMr0XRMHHmABablhUzDl/SJ+oNkt7omt0JaNBTE2q/GpeuDfARFKLG7O5BV8AYo8WxIAFhDVqMWFU
	Ymq/0glob2hbLHGd80MVRnTnROMcyI6lWPdSwm8QIc1tiDakuD8W2Npz95pDlNQ1z8MosKg+g88nc
	Sp5a6qWjW/943plQ3G7I6pIondZOA+swdeCruz0cLwEMtPjEeaLIAaiqA8/frBBthKAU0LND2v5SG
	WEpJGWjWUoIOGAQ0XZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pusFy-00AEFf-0C;
	Fri, 05 May 2023 10:01:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pusFw-00AEF9-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 10:01:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A4E463CF9
	for <linux-riscv@lists.infradead.org>; Fri,  5 May 2023 10:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED839C433D2
	for <linux-riscv@lists.infradead.org>; Fri,  5 May 2023 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683280899;
	bh=Ec2ll/P9tx8U/dBQxy3ZG+nUnHx39GhJcsKwfUcl+ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FJV0yXgxVbxDUT5oHwfpctONYlQwh1inVw1hkoxqIIo7Xh7XU5qLGV96M88uSYps+
	 80ePmkd9mKM0Ta/x82WIzmee0PJRCyknqJh9pvhhuX3AqENGJmm6gqOJpp7lpu9IrQ
	 vX39SaZEKkZVfvL2UlYoUS7lLaxnA8G5TAIdNFWvy0Zln0jvRXeVf4MeGZ2AniAZFu
	 XrN89rpEZ97kXZYAENJvyqcDkjq9NVrNmnBiDnhmExLluGn6BjmPp8qchvt9PM8FQt
	 bRDRT0T9y79aB2p/sPFLSXGAnY5XaPKAsLWsX6Fc96a/76QWHKSKic8/DH39VCXcqO
	 aR+f2BdJwb6uA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-956ff2399b1so287790966b.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 03:01:38 -0700 (PDT)
X-Gm-Message-State: AC+VfDxRffzDPkcw+DEbbbQViLkDZ6mQ5JcBuvyBp8oXCSCIbZFY9ici
	D7a2cusR5WR9tfAUahWMzayHecXjeue5VVjQSdE=
X-Google-Smtp-Source: ACHHUZ6cv5uf8DA2g1qYJdz+yn4p/ZuvFXjDqZGWthSuaLRL+DOJ0hmeFjGg+R/3lP7VI9aiX9CexZ4uVLWUqCuC9dg=
X-Received: by 2002:a17:907:2687:b0:961:a67:29c with SMTP id
 bn7-20020a170907268700b009610a67029cmr616582ejc.70.1683280897147; Fri, 05 May
 2023 03:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 5 May 2023 18:01:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRqdP-RVSMshwzJuAcm1bBeg1-wZU_k_Oo409=O4QZR-w@mail.gmail.com>
Message-ID: <CAJF2gTRqdP-RVSMshwzJuAcm1bBeg1-wZU_k_Oo409=O4QZR-w@mail.gmail.com>
Subject: Re: [PATCH] riscv: uprobes: Restore thread.bad_cause
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_030140_246514_8E921674 
X-CRM114-Status: GOOD (  16.28  )
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

VGh4IGZvciBmaXh1cC4KClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
Ck9uIFN1biwgQXByIDIzLCAyMDIzIGF0IDk6NDLigK9BTSBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpo
dUBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4KPiB0aHJlYWQuYmFkX2NhdXNlIGlzIHNhdmVkIGluIGFy
Y2hfdXByb2JlX3ByZV94b2woKSwgaXQgc2hvdWxkIGJlIHJlc3RvcmVkCj4gaW4gYXJjaF91cHJv
YmVfe3Bvc3QsYWJvcnR9X3hvbCgpIGFjY29yZGluZ2x5LCBvdGhlcndpc2UgdGhlIHNhdmUgb3Bl
cmF0aW9uCj4gaXMgbWVhbmluZ2xlc3MsIHRoaXMgY2hhbmdlIGlzIHNpbWlsYXIgd2l0aCB4ODYg
YW5kIHBvd2VycGMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBs
b29uZ3Nvbi5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMvdXByb2Jlcy5jCj4gaW5kZXggYzk3NmEyMS4uMTk0ZjE2NiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL3Vwcm9iZXMuYwo+IEBAIC02Nyw2ICs2Nyw3IEBAIGludCBhcmNoX3Vwcm9iZV9w
b3N0X3hvbChzdHJ1Y3QgYXJjaF91cHJvYmUgKmF1cHJvYmUsIHN0cnVjdCBwdF9yZWdzICpyZWdz
KQo+ICAgICAgICAgc3RydWN0IHVwcm9iZV90YXNrICp1dGFzayA9IGN1cnJlbnQtPnV0YXNrOwo+
Cj4gICAgICAgICBXQVJOX09OX09OQ0UoY3VycmVudC0+dGhyZWFkLmJhZF9jYXVzZSAhPSBVUFJP
QkVfVFJBUF9OUik7Cj4gKyAgICAgICBjdXJyZW50LT50aHJlYWQuYmFkX2NhdXNlID0gdXRhc2st
PmF1dGFzay5zYXZlZF9jYXVzZTsKPgo+ICAgICAgICAgaW5zdHJ1Y3Rpb25fcG9pbnRlcl9zZXQo
cmVncywgdXRhc2stPnZhZGRyICsgYXVwcm9iZS0+aW5zbl9zaXplKTsKPgo+IEBAIC0xMDIsNiAr
MTAzLDcgQEAgdm9pZCBhcmNoX3Vwcm9iZV9hYm9ydF94b2woc3RydWN0IGFyY2hfdXByb2JlICph
dXByb2JlLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+ICAgICAgICAgc3RydWN0IHVwcm9i
ZV90YXNrICp1dGFzayA9IGN1cnJlbnQtPnV0YXNrOwo+Cj4gKyAgICAgICBjdXJyZW50LT50aHJl
YWQuYmFkX2NhdXNlID0gdXRhc2stPmF1dGFzay5zYXZlZF9jYXVzZTsKPiAgICAgICAgIC8qCj4g
ICAgICAgICAgKiBUYXNrIGhhcyByZWNlaXZlZCBhIGZhdGFsIHNpZ25hbCwgc28gcmVzZXQgYmFj
ayB0byBwcm9iYmVkCj4gICAgICAgICAgKiBhZGRyZXNzLgo+IC0tCj4gMi4xLjAKPgoKCi0tIApC
ZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
