Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4733AC25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6whDGsHW7M9nIq8CoWvQUUrp478N7Lj3tiMoQQKDVU=; b=lB9kj1bW+q/PYI
	EmEBs98B17tUCsnDRW9V+iKeGayvSUjXHrix/RVi+NfZgRFMYUxfD0aTtTeCIxT2ydVEaLrwiKQ/h
	dS+fzm/TofUiIa60EixuWJqjt1LyHfRhxCrJoh52NS6m7tNF+pG/SoV0XZOpDpyWARHHnQGsCTfiB
	5dsnySck5YLO0x6tFjhDhRsFTt+eskQZ2lbT3o5J2D22aHrGAP4wLV/M/Pef+L+VJeEeY5IJ2zLeF
	JmYouhr1o0ZhTCygojMz/71zcrmT6V07xP0esX1iYbPd5sT25MjXoXurHqNTpKx9H1IokJZaQCtAh
	FGD0N9AZN+x0T+Nmpb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8gyA-0000000C5qK-41Cz;
	Sun, 19 May 2024 13:52:58 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8gy6-0000000C5pB-41mB
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 13:52:56 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e34e85ebf4so26455351fa.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 May 2024 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716126769; x=1716731569; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTHLHdB84m6TckAH+4Wb+GMxJLS4kpYIZkcGpjSwhu4=;
        b=Z7uCteXAhPmAGGZF+zexvp2zp1zuDwDnTlBSu+JOcFot/9v6hdsLoASvT0XZ7+sWNe
         VxWLzCpxPicVfeHsgfScikDKYaE/E3kNodozZXCoEttMjKsVyrJwbdEiFk9MC+41Gsg1
         SXtfXK2lE9n30VzTagfvn+EkeaFSoOffzG3vpJzthXpgpm1PBNfSjpjNrrJL/Y+oXLb9
         g5koneB5qKJKyDGMXukH5kZ8/8tZR5hzm84S34tz80SON6eA8suJ6X6BIPH5oDxs/dym
         gmnlwXboB3my0Or29Q/O3NLykyqr5qmPrdPMipRaWt1NE2tpdkFC1mGVdN6srsekIOfh
         Wgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716126769; x=1716731569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTHLHdB84m6TckAH+4Wb+GMxJLS4kpYIZkcGpjSwhu4=;
        b=LiHqPDk3msO1DQm2KGMwB3FqFdAFM2HfzDWbaE27mi/fZq/rWWFAeomwwAkYUV6Ihs
         ROzCXaiwC/zeLF+HSC2D6hnIdKkOoCLmt2IbWvOQhnSAoT8ErgtBtIRDLpAc/uTB/AcP
         swIvzHCgi/5SZHcBJKfz4U8Q4d2TS2MtfTFcrssjmZEzdhhn4ThW4nQpU7+2k7S2we0l
         RflXKzn9ReADpw3F/CAZZwDOr8C9DixDCSwV2HP8zdtEC48iJz2fNhZ5yJvrrKLKDW8V
         krpVFEy/3bD+RGQy+zzpWYGQBK3Duqb95O7zOYvXZAlZC0Imt+1E1pubU4CiXZp2QwZ1
         Itag==
X-Forwarded-Encrypted: i=1; AJvYcCV+FVYMnEcERlQm48S3tQSMTrtYt+XiigWocl3lEInIhV3AhroiGj1TAyTcBxvrS36cWs/VlLBgj6TS2BCitw0qFZy6h4SRlobnFrmsZ3qL
X-Gm-Message-State: AOJu0YyWMQKyBTIVygqUYrNo4CU+1cVAyaBAWc9p47WoGWkEnCErpgzv
	+CCnnX/gL26y60R5QkWYyyPUd+Lhz3fTY3nBFUkPGIgMrI6mv+z0gQPtQyVoND+1I1araec0vSs
	Pj4WXyfp2yWbKhpcUg4rwWmkvTTk=
X-Google-Smtp-Source: AGHT+IGL7l5ZSGrbrBo0LCKpFF739I1zTYOiFnffB7Fy6M9hFZItdRrnHVcbRwkZVd7RUP3GCVeS5gl80V2L1+eZQiU=
X-Received: by 2002:a2e:9ed9:0:b0:2e5:2eaf:b0a4 with SMTP id
 38308e7fff4ca-2e52eafb1e4mr159165301fa.41.1716126769340; Sun, 19 May 2024
 06:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240518061925.43549-1-kanakshilledar111@protonmail.com> <20240519-ideology-nervous-eb30a92e1e42@spud>
In-Reply-To: <20240519-ideology-nervous-eb30a92e1e42@spud>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sun, 19 May 2024 19:22:38 +0530
Message-ID: <CAGLn_=ugjbdszvN1PQ2eN-pLFQmz-EUmhj=2kOUKWWEsbFMKNg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: riscv,cpu-intc:
 convert to dtschema
To: Conor Dooley <conor@kernel.org>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_065255_021932_53AF1199 
X-CRM114-Status: GOOD (  11.32  )
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

T24gU3VuLCBNYXkgMTksIDIwMjQgYXQgNToyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE1heSAxOCwgMjAyNCBhdCAxMTo0OToyMUFNICsw
NTMwLCBLYW5hayBTaGlsbGVkYXIgd3JvdGU6Cj4gPiArYWxsT2Y6Cj4gPiArICAtICRyZWY6IC9z
Y2hlbWFzL3Jpc2N2L2NwdXMueWFtbCMvcHJvcGVydGllcy9pbnRlcnJ1cHQtY29udHJvbGxlcgo+
ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICAkcmVmOiAv
c2NoZW1hcy9yaXNjdi9jcHVzLnlhbWwjL3Byb3BlcnRpZXMvaW50ZXJydXB0LWNvbnRyb2xsZXIv
cHJvcGVydGllcy9jb21wYXRpYmxlCj4KPgo+IFVuZm9ydHVuYXRlbHksIHRoaXMgaXMgc3RpbGwg
bm90IHdoYXQgSSB3YXMgYXNraW5nIHlvdSB0byBkbyA6Lwo+IEkgc2FpZCB0byBtYWtlIHRoZSBj
b3B5IGluIGNwdXMueWFtbCBhIHJlZmVyZW5jZSB0byB0aGlzIGJpbmRpbmcuCgpTb3JyeSBmb3Ig
bWlzaW50ZXJwcmV0aW5nIHRoZSBjb21tZW50cy4gSSB3aWxsIGZpeCBpdCByaWdodCBhd2F5Lgo+
IENoZWVycywKPiBDb25vci4KClRoYW5rcyBhbmQgUmVnYXJkcywKS2FuYWsgU2hpbGxlZGFyCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
