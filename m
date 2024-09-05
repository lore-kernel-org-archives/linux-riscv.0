Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E75CD5BAA
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9ZqAuQT2+l8K1AjdmUIwOEkYEbu0odawlgKAMDtAYU=; b=VTl04YytSSB/4a
	oIZ0/2tWzmTDQ5kUX0YnOiZepNMCTxgF3D3jlQhVFr1YwbuJIkFrgr6t4SHWVQwjDpfgY31zal5u5
	n62hMOTENnSDZ8NQxSimSi+ZjyL9M0iFRNvXlH90LTAnbRoMGxqd0QEJ+02AXVEfEM7nT2VsZ5ktK
	/wI3QziZpwbRwPIuhBcCiEvR5bDYo92caobA1wX4/mSaEoDWik/Coikyoa1uwlWMGywaGDj4veiVZ
	eTGd76TJZvUpKv21YJ7FKk6NCjmqwWOSvXaSjmajfeelQ1rdSsMOQLvIo1GI3HFDe/+RN+4OV2tPA
	S54MqBgw0SnICacmn+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smAwu-00000008Ac5-3j0Q;
	Thu, 05 Sep 2024 11:46:52 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smAwr-00000008AbA-1Ycp
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 11:46:51 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f406034874so8083591fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725536808; x=1726141608; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM+w7SmS+M15Gzb2t7Xs/YrBp02BDmfc8gIF88Qzt5g=;
        b=lT/gzW54BmypAqkyZKhbxZpBLJJulSLqLJtOq1JNbwi2FD7ep8thMce1H8WtkY8sBP
         YcVv1KXyzf7xJT72u27lYPryS75oX0vpjJU1xQXh1a25PAi4p5d3y9YgEVplTQAN+d+E
         juCm8hvCiWOIShmzuzoLPbHS3Lk0rQb6gZPAq5JKIbZHvBPcD4HwdmLEnPIVD8hB1y0V
         +yrAsjIP14zUapsC3W6SnjGdds1K/UZENm96B/Ux3C4o+gzf1fHvx9vQvLl+9N1ZhY+6
         L9TQQle93qPrg6EUnkqFeE2Ydz+eC8gbyTLFMreOAPBS09DCCUXuvTCVaiV1LJNE9Jio
         n90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536808; x=1726141608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM+w7SmS+M15Gzb2t7Xs/YrBp02BDmfc8gIF88Qzt5g=;
        b=fqH0T1KtL56szLYgqhzGQvKitqZAMCdeuUboy8IthJcyO9DO/M7k0upBQLEptLhwHD
         gVEIxjBf78qEs8Jfb86rk6zwxT7QAODnt/EfaLwBXXBuw5/Na7xGnkwNNE1e0eOV2kzt
         nGN778rVwj4vUbKvGc0UxBkayQ+m90/vi3XaMSqZEVj+nvDypRR4mt6E5aKbFm3JN7fS
         od18obVnf6pqgcvejCMtMrMpGPDgPmgmL8Vo0VgiFaQQ2CeuD4VDATl2Q3+8Z0KYmzyu
         X0CPmRfih2o4SH/gmq8inpWN6xUUopnWnlDymPVWnPe4nGPlGGrKatbMsjc+5+1wSMXx
         Wq1w==
X-Forwarded-Encrypted: i=1; AJvYcCXMFwZ1uEqCsThgfwe8MTLd0ojQc/LViBM1KyejR5AG96xwcgbElQu+AXsxrBany+VP7qdlf7wvntYs7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU2L7S7yM+NXLUa/mOomOoQ54QvN/slzzXiJeiOnnUUijK81vP
	cjLi6LJjgKyAPBbBWXQ0CoiO9toODUhw21D9b2EcVs8Zk8Lgqw/Nsrpi3cmhqUl88aKf3DCYrwd
	vdg/xhRW7qc66zIliFSskvt5nxp5RCDo6pBhjfg==
X-Google-Smtp-Source: AGHT+IHCsGQBYwg2ohwx5OLsJ3HR5XOoonPUOUhGDfgKfGVyaOU9Jfn9m+n8OOre+5olcGMI+3GJhnGkwebhcYZHI3g=
X-Received: by 2002:a2e:b8c6:0:b0:2f3:e2f0:2b74 with SMTP id
 38308e7fff4ca-2f64d54ff96mr53248961fa.36.1725536806884; Thu, 05 Sep 2024
 04:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:46:35 +0200
Message-ID: <CACRpkdbNwpiaXKgkZfq6cw5LuW7RGxCuQvF4n3F0YCcUqKSf0A@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_044650_335717_827A2608 
X-CRM114-Status: GOOD (  17.03  )
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

T24gVHVlLCBTZXAgMywgMjAyNCBhdCA2OjA44oCvQU0gRHJldyBGdXN0aW5pIDxkZnVzdGluaUB0
ZW5zdG9ycmVudC5jb20+IHdyb3RlOgoKPiBUaGlzIGFkZHMgYSBwaW4gY29udHJvbCBkcml2ZXIg
Y3JlYXRlZCBieSBFbWlsIGZvciB0aGUgVC1IZWFkIFRIMTUyMAo+IFJJU0MtViBTb0MgdXNlZCBv
biB0aGUgTGljaGVlIFBpIDRBIGFuZCBCZWFnbGVWIEFoZWFkIGJvYXJkcyBhbmQKPiB1cGRhdGVz
IHRoZSBkZXZpY2UgdHJlZXMgdG8gbWFrZSB1c2Ugb2YgaXQuCj4KPiBFbWlsJ3Mgc2VyaWVzIGZy
b20gSmFudWFyeSB1c2VkIHNlcGFyYXRlIGNvbXBhdGlibGVzIGZvciBlYWNoIHBpbgo+IGNvbnRy
b2xsZXIgaW5zdGFuY2UuIFJvYiBkaWQgbm90IHRoaW5rIHRoaXMgd2FzIGFwcHJvcHJpYXRlIGJl
Y2F1c2UgdGhlCj4gcHJvZ3JhbW1pbmcgbW9kZWwgaXMgdGhlIHNhbWUgZm9yIGVhY2ggaW5zdGFu
Y2UuCj4KPiBUaGlzIHNlcmllcyB0YWtlcyBhIGRpZmZlcmVudCBhcHByb2FjaC4gVGhlcmUgaXMg
bm93IG9ubHkgYSBzaW5nbGUKPiBjb21wYXRpYmxlIGZvciBhbGwgcGluIGNvbnRyb2xsZXIgaW5z
dGFuY2VzLiBUaGUgcGluY3RybCBkcml2ZXIgY2hlY2tzCj4gdGhlIHVuaXQgYWRkcmVzcyB0byBp
ZGVudGl0eSB3aGljaCBwaW4gY29udHJvbGxlciBpbnN0YW5jZSBpcyBiZWluZwo+IHByb2JlZC4K
CkkgZG9uJ3Qga25vdyBpZiB0aGF0IGlzIGEgZ29vZCB3YXkgdG8gZG8gaXQsIHRoZSB1bml0IG5h
bWUgY291bGQgY2hhbmdlCmZvciBzb21lIHJlYXNvbiBhbmQgdGhlbiB0aGUgZHJpdmVyIHdpbGwg
bm90IHdvcmssIGl0IHNlZW1zIGZyYWdpbGUuCgpDYW4ndCB3ZSBqdXN0IGFkZCBhIGN1c3RvbSBw
cm9wZXJ0eSBzdWNoIGFzOgp0aGVhZCxwaW4tZ3JvdXAtbnVtYmVyID0gPDI+Owp0byB0aGUgZGV2
aWNlIG5vZGU/CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
