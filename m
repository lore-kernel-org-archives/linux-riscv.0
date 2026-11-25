Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F0A606A33B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OCFGNVxF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=SWXiuFUA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HVHNqYd+VVecKLWeLSktlkcfKwl2s2pVlL1BTWR8nts=; b=OCFGNVxFOfKT+sKysyGr2JbIc6
	AfgLRzVwCJstnE9zbpl6hZWxhsEYehEdZR9eMcvL/HFQJlvV3iVmK6067+eXQcgZzkA/k5HGj+sOT
	vW906drN4/kedrl9e7RohS+e0D9G7L0h698h9skxsa44rW1HooWPoBSNW06R9kJffuY0X7YYgcQLm
	+VllVV7+m8ATb41k1YPxV9A9zwHA9JnP5lEnruqnPGTD3sCbYNCQwMJEeloameWlQH6ByqgdoMG2x
	wUCywogVFDhGqSzpcU2T99tLn/nodAwcik6p++R+I5Ybgg+9ahnSuuJ+yykWxh8xv+fKkRYtRMlhL
	MLk5uxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tV-00000008UK8-2uzX;
	Wed, 25 Nov 2026 05:50:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tS-00000008UHz-1ixD
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so48755435e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585808; cv=none;
        d=google.com; s=arc-20260327;
        b=BiE7Q/6uHS30dHW7XD5bQ7KP8Wr7Y1oWVZx44XsxpMrgipcqdwhhaRkZTlB9SNEoRu
         wGMCaaszsUSVS9HMTy9mNiDsdCuxdE5IfK6GO2maXO79KDCiWaPcHx5PDYQ7/ahaVEud
         v9T3BV2eXFsnghHfVZngGvFYgCcGOEAUz8YQI4j2ZLuDhLWfNYW9PVULWguQZQm0cEWB
         nFkoqPnuxO7HL2JehxTCBjD91pGQrhYPP3GHTq6zstj3y2YC8sX12cv2LwlhELrePHab
         8f9AV6zfjwoqNqYpZy+71WrtfzLlvfMeeTEhQgteecLosAbMBxz7wiBeMUUfKTjyphWH
         D9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        fh=24o6uq+c8jsaDJaimRhCjQgJEKtmv3wnoDALUmzb6jA=;
        b=bFuHcIN6n0CX+vyuR9xlJ+SaIEjhE+piZb7BDHb29imZQoxacA+nLdR/aOJH0InLwv
         Zz4wsq8Etp5DhVtpQ31HsQvS98pMdRE4MCi9wfVVegILRKDpqKstAIlmS+pwkO+YjKj7
         nj8pW5yDn9/TrXKrud82VWnCOyFS2YAz6D5RSM8tA1v+BR6i2KWsrUgqXsYk5IOW4EcW
         LbSeGAYUwurewqE69AljFInh+v7PC83XVl0XFySfbpDCtTNa1Bo/NmEZX8XDiPXZnOem
         lpAVgymFsNJ7T4kG/CfTb+4p0CwgXAvI1gwJmV0yBD3Mr+31CWXPwHyhwE1xGKVvRgts
         3+qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585808; x=1796190608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        b=SWXiuFUAE+vUWjaZ7OLv36+Kn0gnpnPan/LfTo8JwamG2LMz8zaymzV00KIr6w1pPE
         NDxkizo05OkMIxeLJat7JxXl4BC19uCUS4NonHDnzGAoBbCQ6N4wx14avMijqL71yQyr
         tqIZmbMxk3nb9K/wiWOSlec2pNmC8nGiAvGEU1h8Nj36NacLVcg6P1bxLvWluZDeezer
         Ra2gl05/Q8e90FUFgNZMa7xMQj3cFXGrp1a0jwQKC20C+XNmqJegdV7Sr/UlqEo+GLDl
         yOPtFKuqOEaxA+pm4yrJpXvd8Pzo1IvzCGIthSEvxbsCiL5mPOlJVzwXhFxXNb5yH9Xu
         vsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585808; x=1796190608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        b=obJ6BDBIQ8IX09Teqtk4czkEGyDk21XkOw9smfoBRhHPL8GKK5Pm8JX9SMP5to9kYa
         cOyAkO7ygvMl6A9n6d2XGuTBviwlc7K3AHTEtXEEnbMTuqQvQGM7G8In4kL/3Hm/FyHy
         zK47yNYevwSwPMS4KtxyABKmbDwxTc0STJbMpIAyyLYqMzEgn+w3MQyVdqfZiVfzBiBB
         li4neSM4RTEgjS7pu3DY4k88U4RRVM7OxwygmDHOgjMfz6gj5jeeCtihyYdlSu3D7cWo
         Z/MoG/dzAx8r0BJlMyh8Wy+hMd6oKQCSk/d5qX67tZ2m1AsLA5aG85VAAZJBy1ogUjcG
         t7bA==
X-Forwarded-Encrypted: i=1; AL+hErHozaL6Tc8dtMom437ucVY3IJmOJs4TaIrPoW5tNc5evR6VNHM0choTxDJl93HWtjOl1J2igzNwzl+4GQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+vNnDsbqgcIbhDArFjFxBq5EmeWSQGx4xfe+VCdnmqv4qX23V1
	yw9PCjQGIWSjU4xXT6q1W3OMQUkNTf/P/SXJ5SSAUYUe7SRE5zW8wuor7BN8fM3VG1PRyK5/57v
	vHJ5mmwZ5VHZl3p1zpCet/oLPaeac3C/rMhvAgiNacA==
X-Gm-Gg: AZFdTZdpwzZ2lD8Yr4Z58gzpiDTqHBuLKyhkDyt4VJSzFfu4yZ4UH5Zg5f1wTknDdia
	hCDBuS3WacBcOT8RVeQ3BF5tAuFg05EYXmsOrR82D7TVWhFNrBNGxttLVa8iW7jDimVtwMY/bv5
	tzBDbIbttzj0YeUTW1vdE61c1YkF85pvqSGJHrmpm5NlHouL5i87GGlJZO84srXcFS82mH+GMrz
	slKkJh4BNuNA3IbGfwaRfzIfsCuzT7VaJ6+xYfEMo9/9/eycldeNzLgGfcrkcVi9m9/uwvJ0OdF
	vEo7QFG1hUBzhv1kd9WN16m3gXc7/Wv5CkO7rI5hSMehE08mbgxEKn3lLqw6I8EQsttjjK2StqK
	6qEkVFthFT2GhwtLAqTHbJG0DVrw0R+BhhHCwkn12BoYa8IXSLropyJZbnRiCtXsupB4DL3sFwB
	3CRf09dJIv7UYY7aB9XJPHCT3HbgpYtulIhASfR57UQi+zVBQy6Jm3Bwg=
X-Received: by 2002:a05:600c:1d29:b0:4a9:2a92:231f with SMTP id
 5b1f17b1804b1-4bb88804d4dmr362487905e9.7.1795585808512; Tue, 24 Nov 2026
 21:50:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-4-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-4-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:56 +0530
X-Gm-Features: Aa3M54olVHavWeAlguF4P6c6438TRdv0cvM9VsXLh3lRZmC_JVPz05hHC99ALdY
Message-ID: <CAAhSdy0Ev2MKxS6J1OrD+mHKMw-izwi5ywHLJZT4fN0K-U-CHw@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] KVM: riscv: Write-protect G-stage PTEs atomically
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215010_470030_485C708A 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gR1NUQUdFX09QX1dQIGNsZWFycyB0aGUgVyBiaXQgd2l0
aCBhIHJlYWQtbW9kaWZ5LXdyaXRlIG9mIHRoZSBlbnRpcmUKPiBQVEUuIExvY2tsZXNzIGFnaW5n
IGNhbiBjb25jdXJyZW50bHkgY2xlYXIgdGhlIEFjY2Vzc2VkIGJpdCwgYWxsb3dpbmcKPiB3cml0
ZS1wcm90ZWN0aW9uIHRvIG92ZXJ3cml0ZSB0aGUgdXBkYXRlIHdpdGggYSBzdGFsZSBQVEUgdmFs
dWUuCj4KPiBDbGVhciBXIGF0b21pY2FsbHkgd2l0aCB0ZXN0X2FuZF9jbGVhcl9iaXQoKSBzbyB0
aGF0IGNvbmN1cnJlbnQKPiBBY2Nlc3NlZC1iaXQgdXBkYXRlcyBhcmUgcHJlc2VydmVkLiBJdHMg
cmV0dXJuIHZhbHVlIGFsc28gcHJlc2VydmVzCj4gdGhlIGV4aXN0aW5nIGJlaGF2aW9yIG9mIHJl
cXVlc3RpbmcgYSBUTEIgZmx1c2ggb25seSB3aGVuIFcgd2FzCj4gYWN0dWFsbHkgY2xlYXJlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFNldW5nSnUgQ2hlb24gPHN1dW5qMTMzMUBnbWFpbC5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
