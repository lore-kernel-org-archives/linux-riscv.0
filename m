Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB600CA6001
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rK3Q33Kc75ScgGHZM/gj6aGDBwlQn7XymwbHd7/kIdU=; b=rbfQNiyP4v+wW8
	SW7VgVjKyKuWIu/hOvr1lRSfqciOSzrGP9natSOQyCfePKkHEP7jvfi7fTqwAlIv51xiB/aYTUD+A
	hQeM4CP0VMWXU+dA2w2xipRgZxB9+zz0xahoI5WwQwYzV4BjFGmnO4XWGOTP0QM+M6lIKJzeUVCaT
	196VyBkiRuvcO2FqSF7+swhOtM/QWr5GjjErgEFT/3zNb9+/MSHKfoYETZ6vJd0jsuVqy9nlgsjqJ
	e+3gMvs5d+vDWGfgkBqVKRxs1YFsMKA9OqOBlF+5hCBFukkiDzhEuR6NOA7Z5HTI4cxAr93s3+nn2
	zyWrL3sIefBvhZ+M2p5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7RA-000000014Fm-3Xj7;
	Tue, 06 Oct 2026 15:50:40 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7R7-000000014Do-130g
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 15:50:39 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8abd68b3937so29982537b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 08:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791301836; cv=none;
        d=google.com; s=arc-20260327;
        b=lssNr97HFv6hO8suqMXTLv9LVZRn7rVI9e8Dx89KZcy6QfjwpNiQRSxADeONpOi/ls
         SgC9yYdfct+2fU8SPw8p8cekmwwqd+P4vzcZGZjSyLjmolDfBVgOXYEIxKzPTZTvPywt
         NlfnM6RbRET80ZIno5akCx+04I6UplX5k2WmCe22vjwciijdZupkNfzExE4Lbqf0mywD
         RhgXS0HGrFTJYW4LzTN/AfPg2BnXnoh389IPteAbahG5NSCz3CnPzSdLRo3G+M98tAKY
         8xOEL/1TdaDEKwBozo0U6UkZYLY9bXbReiXZ6mX4F5GA4o1Bd6pd0086o9A7364R5VKc
         SsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVTf+5nPszzSOjjP6JGia1N3BVw0TCy5I1d9nkz0VXs=;
        fh=Wixib5bpE8XcNIT2E5wBZ1wczdo/W6TinkHF4ROOl/A=;
        b=RLGyRq0L0D49s2PnyQLWLRqOvs/yeJ0PbXKCArinGuKN/XxRkA7yfAC09fAhEurLKK
         +UbxFQPmcm4tl/OW43+eoxQEhUbBq344kgcMBo86mAF+zXYgFhvprFwtZ878feBtyMUU
         K/7eXD6S8g4yxLTpq/Helwh+R6FV/3dTXq0zbVs98Qv/e6QDJbLcG/TmN9R4uVfqQsRe
         QqafdK2+LTqfDbP4mFQDxPURW3YY50EyNyAL+0rnUcj8NPLv4REZrDezuPXbBy+qxzDG
         +6qin4Sf56pSWQ8kdAfVgSd5f3PFH112Pph72ESpoqKvoTF56M6Yl1zLSefdOvsbYc50
         YNBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791301836; x=1791906636; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVTf+5nPszzSOjjP6JGia1N3BVw0TCy5I1d9nkz0VXs=;
        b=TZmBorBfXoX0YKHGlvKoBUVR+BSlI3D2BuuC+jW81KS2OXQF9ugCCevRUgIFwiVe02
         lBDedKCyXvnd3eRJUIi/tzesttQsFptUiIzOoHX6xhiIbJ+Ak7BpvaEGk4bAprO/7daR
         lnVwJrF3elHZvSpi+/wfAWRQDRQwFDLPNNA9cvPZJwg1AZkMa+n67LfHldtHKhVYDkka
         utdzosUT6AP4yKMpJCnp4Ztom+8EyCHMIiG6Bmxnzsceil0xDMmAu/EAYWxx5XafQxKX
         N2tgmYoB5FDgl4YplmVEWZVKFRDQ0HIEmBX5pX4qX7b1FjF9hGjdkRqLlVwdNkzLYTMO
         IEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301836; x=1791906636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVTf+5nPszzSOjjP6JGia1N3BVw0TCy5I1d9nkz0VXs=;
        b=19ZQRF8J3mcniUOLEYZQY63OUSvreGaFrWJi2atOsSzdSlK8jcI3lPzzaA87iQgQ21
         r0KTwt82RA+KAeP1hRpEeE9UV+176643FrUO8rZi2hgnx3NHNpe59KBpNDQiZxW6FcrW
         bJg/AgOFeaKGREZAVaA8XvobJVSfwfxaC5kdq1L4JiJzknkYt3XTV66Ebce68NjFn5Ym
         15V8VSeJEWVp0/V3ZnMwzzxFdCOfmN/h3LqHamkZ45c0f5pgGtCFAIyP+nNzBIx0vB8r
         xYUhx9+4g4JG1q/lsgy1kB9FIoyCSeSBntSEZiBga28lD0NH5PcCpDZEIUn78R/9SkYf
         M91w==
X-Forwarded-Encrypted: i=1; AKwUvBys383eEZPK2k2OZz8liRVv+Nf/lT1slKL6KLdPQyihCshwjrMOtHxjR3qkEcoHOEBYAetCwX56Ysr/AQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIBWOzxAnP44lVX7lhZfuD81MDBa651wQ1Z9GgvDWUJI1NrSFbl
	GwXGS1h6E+qKxxtkHJKS9lFH/t9DACH/MFbVuon+J517JfvB/m7C2UV6OfNiq8tHTKaN/h+APeM
	biX50pXmvEAhDL1S/38Jdq9F8oUDmq5IJwwHGWGzMkw==
X-Gm-Gg: AYBFou3ERiTKqjD3WjHqIVdtacYpLuEtvCCqySUcTQ7/njUJ6KAxZB1M1hFv/pM3wCV
	JbxNL23jnkHnHWwS1Li9bgadbeI2MPO9XRbHo6PnsAQc8GewTLN1RZb7dWi+JUoQVYC1HBikx47
	/tvLCWjRXUWhEUthDqfsJdfYiOmb+H+EpXmkRmG7IgMgYiSpPRGby7mbNldwZIM8chLlczYpIcu
	7Ufg3jbWclZIVqT2g3BOkLr3TXoFDMRjmYcb92jFm3w0TGfmLKrRWJtiHQRiF7GEGndmbELw/Vk
	n5C4a+FtCJMr5B14rteb32zSvoFVsPYdhbypYXLBV3XA9ElGqiNIeS3fMpTD/c13tRImg7cfpfI
	SEz+kRLgCwQ==
X-Received: by 2002:a05:690c:d8b:b0:870:107b:6359 with SMTP id
 00721157ae682-8ae94cb498cmr52594837b3.15.1791301835837; Tue, 06 Oct 2026
 08:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk> <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk> <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
 <asUGoxyJWVcsYBWG@lore-desk> <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
 <72e19e46-3a14-4a07-9b50-01e5480bf1a3@bootlin.com>
In-Reply-To: <72e19e46-3a14-4a07-9b50-01e5480bf1a3@bootlin.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 6 Oct 2026 10:50:25 -0500
X-Gm-Features: AclHuK8RliQGPhyySeVwku8FmQeRKVliSgaQe4flxxpUxxtotWhsC2bRW968fZU
Message-ID: <CAEev2e8JDjU6PdV+5PjA90YqiMs2bskLhNgs_gAp2AAY1quMWQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_085037_293349_1915D601 
X-CRM114-Status: GOOD (  10.32  )
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

SGksCgpPbiBUdWUsIE9jdCA2LCAyMDI2IGF0IDEwOjI44oCvQU0gTWF4aW1lIENoZXZhbGxpZXIK
PG1heGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTAv
Ni8yNiAxNzoxMiwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+Cj4gPiBNYXliZSBzb21lb25l
IG1vcmUgZmFtaWxpYXIgd2l0aCB0aGlzIGJvYXJkL2hhcyB1c2VkIFBUUCBvbiBpdCBiZWZvcmUK
PiA+IGNhbiBoZWxwIG91dCB1bmRlcnN0YW5kaW5nIHdoeSB0aGlzIGlzIGhhcHBlbmluZy4gTWF5
YmUgdGhpcyBpcyBzb21lCj4gPiBpc3N1ZSB0byBkbyB3aXRoIGNsb2Nrcy4KPgo+IEdvb2QgcG9p
bnQsIGNhbiB5b3UgZ2l2ZSB1cyB0aGUgZnVsbCBkbWVzZyBsb2cgb2YgdGhlIGJvYXJkIGJvb3Rp
bmcgPwoKaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vYXNyaW5pdmFzYW5UVC9kMWI3OTU3Y2I2ZWM3
YmRmZWQ2NmFmNWVhM2E4NDYzMQoKUmVnYXJkcwpBbmlydWRoCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
