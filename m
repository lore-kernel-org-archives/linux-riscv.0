Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31230606A327
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f0sgEPgm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=GQC4XNx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ymoDin4VFRF44H8Q9TQeKuu11x0MzzlBo7qP3PM9aw0=; b=f0sgEPgmj7P6gpw8zXdugSvbPO
	F+U042tm7xGoGR8HddOT/Ag/ZUKFoN3AFs8S7ufbWVOrioFf0IqtLAIMf7W4C7CApRpattmJt36gS
	OKzMrwgqnE0NNBHEuDXpRCbOKUYRSrUK7XYAE1/g645/qPPbqQf7bQt+OZCFYS3putnrMK8jIsOFF
	axLnVOKh2wy6iuuGmfRpaltIisHdp0kG5aPOyvVcHkJzr6AsLxqPwRqVT7hkp268F6Be8Hbs8fq3x
	tlyEl0LDXo3ECb+yCEQFFvEMRUU07UMMi75a192ecGsHV6G8PKcAMtUkB8Iz2O+hn+iYuH8YV/xmc
	xtDHmc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEaG-0000000AIEh-1y8w;
	Wed, 25 Nov 2026 15:06:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEaA-0000000AIBm-40MI
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 15:06:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so7592445e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 07:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795619206; cv=none;
        d=google.com; s=arc-20260327;
        b=D9W6zykuhwctZwg35K2lh1+oZNc6jhZd0AI7Zvn79jPKvEDjf+f2Y9NsFe1tAdaLfa
         FP2fPmdTDYnh1UxcR3q/5cYA2vIcs8vTcIXk5zqUNeiiWfRQ5pivfNsgi918VBDdeUqQ
         TG3QgEN7qt3+Nfwr84YN8UcgV8RdiRt6lTolsmWOraYXu2MdDxGAkISax66FUnAH+iFD
         XogUZ/YqjMUnZPsmyd6Njg6NpliOGfwNQsp3Kxa8m0flWbb5ZVzxU9uFHqb9bP3jUbIN
         hlFxfdMKzy+SgwZ/HnsxGUGztzQ6tA0tzVWxiklLiQFCup6XGM3JSlS/0OSCfGE+EgPO
         LZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        fh=LGef5n3faAp9UifRy7GAHRC7S6FIM2kqYWvGp0qidrs=;
        b=Opr/VXBC++2CsHaSBw7XiVG7/lmzWbU9a2f9Y1Q4+SoDN0MZ0qhvjcYUow5MH0l0q/
         2ZzfH6Rx5GvlNkkznqsRGhev8qX1cSHnJoGMwSqh8y5OPp5g469C8Z6+0KSq3goqAGm5
         T3Fc5VgnzC9l25UaYTHSMUT9RaMZNAT+WDFDIDslCzuluxi0v+zaRgYGmrJJoffQqMM2
         VdD8OPTah4o2MDj/Sg0BfdtHVmY6GouPIvFYp98FPZ1c89iCyUzTF7NjlrrCqYf/teAD
         rfiktEKVTcpYENIdieruRAojehLvJ/9A5sWPPJrpo+AdjSpUBl+ccLEiNni9U18Qpt7L
         UAlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795619206; x=1796224006; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        b=GQC4XNx8xv2jzqMwAUuwfvFFTTPpTlpUQbDBQKgpqc7gAPA6ytWmRG7ZN9F1xzWL33
         k8XQ02skWX6EX9yoJ4iYLpQV5nYNFyKg7meb832ZeQ6UleHBwQcCmC2x+w+RNxdGbeCv
         zLy5kBkRqMc+Pn+cPUhAVcUKqEsFRqRZq11TqOTBL25IKYgJso62ZUO/9fRHH7QMeTb3
         NJqwNfz9hz8C3gXGZhln+vWpYRffctC3DpkOZ02kRuCZKFbJntsx2nB6oOm2nqDB54WX
         hDqr/3QXEMOAsHhFnF/IJ3ZyPNDn6kJ+v4p3w5dvQkZk8eV3n8DjXzUi4O6QuWNbIVfM
         7JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619206; x=1796224006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        b=gD9BkDbp0/eloDlIXBRg/VkpY9Q/H/aSYYwtc98iz0HTY63TJncAvbJG3HC3mcpzuA
         OW7rz/SUMEv53NpqZrz2JSSYcsnCMVcnNPzEqt/55UY31WFHAqFU/gFDaEa+yRZso/gz
         6G6/D/RLEQDcQqRHxoNNFDvcancjvoAX5hFMkwERsIDUZkv3tdLBGjV91Ms/RgUIEu5t
         yz31IfvTSsopVIu03nUnPg5pGUFQVn+2YLCYifHEGiKIvN66Li1dfEaqMn1n7z15hapJ
         JzpF3EZQUUIDlfCTBHOlQi236mjaaN3ZP3efPWUyn1S/jSMImPDhp2fA8TfEgfJzTLRg
         DncA==
X-Forwarded-Encrypted: i=1; AL+hErFm6VVh9STGsw9tDtwHgLDdn0lbRN1nn7IXGUokxw6tkPNyZ7K/hJEAWMho4s9G9cdbJAQ9BBfUrwgkpA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9RO+Nq7y7Qjhf+DaUE3/mtk7y1+xLzMboRb6qF+Rhl7Lb9AOki
	phCexRJw0gOYSkT5mMwFBwxoGvVOjVdC4DSzc0RQefe9V/3Q8MA4otEaaLxSMG1kOE1VIXMYFnx
	cMVOpSjRDGyApU7HqHXfxnuZijM5F8i6oNZO3euR9Dg==
X-Gm-Gg: AZFdTZcc1QceRKXZIdTZJInakV1tFBIkK0dhw84aRSXJxcycCNhuZC3YxfnWuHXtNv7
	iL2VhnDK6qbCz3tJW4wNAauQRfvqBiNwQ5YpNGggmUHs0HXeR2CopiScu0Kqmc+SCaaaLXyXtWB
	RXg/svfHKg+xIIfT4UG7DSk5tyJ8Ft8KX2W7bJQahDqQ7JB/5fS4HN8MkuvsKDdzDXPp4hKxb2G
	zhuFrB218m92k5xtAptp8GqiC2SFkmECHKqtQb9JBgjlEVD5P3kTL11TdhVf5l5vAVra31kA+8o
	XJVeh5QuiIOo7TPfsjXNfI77hwSnSXv43xTOlBLx9OUXDrxAMmaMwq++nXadDdAL65m3WEONwVh
	cHV8wxn+WviPLS7uuwTI1qyBcs2oDIylw4HPDANwgRHs2wRh4vCiRIOOfsIEEPMjLNVjPk5H+UE
	vtNqbk9ckm8trcqfV674DfU+v6PVsYJZu/L84/2+GBPLmH7tsODeAo
X-Received: by 2002:a05:600c:828e:b0:4a1:cd83:b23e with SMTP id
 5b1f17b1804b1-4bb88786ddemr337232595e9.0.1795619205644; Wed, 25 Nov 2026
 07:06:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260914055936.3672758-1-wang.yechao255@zte.com.cn> <20260914055936.3672758-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260914055936.3672758-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 20:36:34 +0530
X-Gm-Features: Aa3M54rWb_qwV0lybeTg4v6ZPTlnIV7_ygoXoP0dqWuArNVCCcEttr1PQxaya24
Message-ID: <CAAhSdy2-HGNfbBCJeXPS0wyTaSt+C9rHw08K6dn5DcJCLWy+rw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] RISC-V: KVM: add tracepoint for guest page faults
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_070653_387511_5EC0AFF3 
X-CRM114-Status: GOOD (  14.06  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTE6MzfigK9BTSBXYW5nIFllY2hhbyA8d2FuZy55ZWNo
YW8yNTVAenRlLmNvbS5jbj4gd3JvdGU6Cj4KPiBBZGQgdGhlIGt2bV9wYWdlX2ZhdWx0IGV2ZW50
IHRyYWNlcG9pbnQgdG8gY291bnQgdGhlIG51bWJlciBvZiBLVk0KPiBndWVzdCBwYWdlIGZhdWx0
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS90cmFjZS5oICAgICB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAgMiArKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS90cmFjZS5oIGIvYXJjaC9yaXNjdi9rdm0vdHJhY2UuaAo+IGluZGV4IDIzYTVmZDFiNjg2
ZS4uMDdmY2Y1YjYwNTliIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3RyYWNlLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS90cmFjZS5oCj4gQEAgLTEzMyw2ICsxMzMsMjggQEAgVFJBQ0Vf
RVZFTlQoa3ZtX3ZjcHVfaXJxLAo+ICAgICAgICAgICAgICAgICAgIF9fZW50cnktPnZjcHVfaWQs
IF9fZW50cnktPmlycSwgX19lbnRyeS0+bGV2ZWwpCj4gICk7Cj4KPiArVFJBQ0VfRVZFTlQoa3Zt
X3BhZ2VfZmF1bHQsCj4gKyAgICAgICBUUF9QUk9UTyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2
NCBmYXVsdF9hZGRyZXNzLCB1NjQgZXJyb3JfY29kZSksCj4gKyAgICAgICBUUF9BUkdTKHZjcHUs
IGZhdWx0X2FkZHJlc3MsIGVycm9yX2NvZGUpLAo+ICsKPiArICAgICAgIFRQX1NUUlVDVF9fZW50
cnkoCj4gKyAgICAgICAgICAgICAgIF9fZmllbGQodW5zaWduZWQgaW50LCAgIHZjcHVfaWQpCj4g
KyAgICAgICAgICAgICAgIF9fZmllbGQodTY0LCAgICAgICAgICAgIGZhdWx0X2FkZHJlc3MpCj4g
KyAgICAgICAgICAgICAgIF9fZmllbGQodTY0LCAgICAgICAgICAgIGVycm9yX2NvZGUpCj4gKyAg
ICAgICApLAo+ICsKPiArICAgICAgIFRQX2Zhc3RfYXNzaWduKAo+ICsgICAgICAgICAgICAgICBf
X2VudHJ5LT52Y3B1X2lkICAgICAgICA9IHZjcHUtPnZjcHVfaWQ7Cj4gKyAgICAgICAgICAgICAg
IF9fZW50cnktPmZhdWx0X2FkZHJlc3MgID0gZmF1bHRfYWRkcmVzczsKPiArICAgICAgICAgICAg
ICAgX19lbnRyeS0+ZXJyb3JfY29kZSAgICAgPSBlcnJvcl9jb2RlOwo+ICsgICAgICAgKSwKPiAr
Cj4gKyAgICAgICBUUF9wcmludGsoInZjcHUgJXUgYWRkcmVzcyAweCUwMTZsbHggZXJyb3JfY29k
ZSAweCVsbHgiLAo+ICsgICAgICAgICAgICAgICBfX2VudHJ5LT52Y3B1X2lkLAo+ICsgICAgICAg
ICAgICAgICBfX2VudHJ5LT5mYXVsdF9hZGRyZXNzLAo+ICsgICAgICAgICAgICAgICBfX2VudHJ5
LT5lcnJvcl9jb2RlKQo+ICspOwo+ICsKPiAgI2VuZGlmIC8qIF9UUkFDRV9LVk1fSCAqLwo+Cj4g
ICN1bmRlZiBUUkFDRV9JTkNMVURFX1BBVEgKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDg4ZTBjMzY5
YjM1NC4uZGUwMjYyZDBmZDk1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhp
dC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiBAQCAtMjksNiArMjksOCBA
QCBzdGF0aWMgaW50IGdzdGFnZV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3Ry
dWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgIG1lbXNsb3QgPSBnZm5fdG9fbWVtc2xvdCh2Y3B1
LT5rdm0sIGdmbik7Cj4gICAgICAgICBodmEgPSBnZm5fdG9faHZhX21lbXNsb3RfcHJvdChtZW1z
bG90LCBnZm4sICZ3cml0YWJsZSk7Cj4KPiArICAgICAgIHRyYWNlX2t2bV9wYWdlX2ZhdWx0KHZj
cHUsIGZhdWx0X2FkZHIsIHRyYXAtPnNjYXVzZSk7Cj4gKwoKVGhlIHRyYWNlX2t2bV92Y3B1X2V4
aXQoKSBpbiBrdm1fcmlzY3ZfdmNwdV9leGl0KCkgYWxyZWFkeSBjb3ZlcnMKYWxsIHRyYXBzIHNv
IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCBzZXBhcmF0ZSB0cmFjZSBwb2ludCBmb3IgRy1zdGFnZQpw
YWdlIGZhdWx0cy4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
