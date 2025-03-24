Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3694FC28B30
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 01:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DP8zvg8Q9X8JlEPvkvqAdMzCP9ufoYgehPUJjYvr734=; b=krCQ/XtpWn4GQU
	ENusTzXepQJVESm3ITITeshSAOTCv/Wn/dTQrV4JAtCJBRLqh871gnvQmsEG004wl1AxUeOv7ZWGI
	BF/+kB2qq4EViRCzS2TKn1Lig3CL41RK+lMAJ33TJ7WBFGjnCsC04U19vfbFQJGbJmltmAORf7hAV
	90INFb6zlnQIWg3sE7Nq4vQ8UZg0eT3N9bLVND54wBHXmvZf+XGLZSslNxFjrDLPCte8XYvKUxXcc
	N/kGlSkCmOrNFEnwKBdKSg/aUqjDrGMEtFyumrOIz608UU9prPXKWxdVxmfIMjuODG/oBl8SQvZee
	TddQXyo1IUxLUfsnFk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twWhw-000000021cc-38TO;
	Mon, 24 Mar 2025 01:34:28 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twWhu-000000021c1-0Xvh
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 01:34:27 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2b8e2606a58so2034856fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Mar 2025 18:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742780065; x=1743384865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84ZRmXHdIlIW2QrucBXK2LcEOPMw3sQpnxJmzSe2fYY=;
        b=WZ1NLKWf8phqc6iC7QyeMPGz+eWFO6upZxo5misnCVIIUqeUQNGUTCX7/go05lNmEg
         oxdrNOfODfw8JL6zbrVWHN559oI1eHIpjUqe1eJ1F4t/52HS5PyxYXMtuCT6F8K59rt9
         ua5bBdN7gS0sEq1GLuXJu0IgKfFU7ILEcAMtJHVqBMZVwp/jau5KZ3X6J1+bE2FT6nir
         2zyLLUC7CzOgHAyvtHUZTp+T5JBbUrayt+AUSqym+lkUew2g713Ef2DixQ2MQ3TO2QeZ
         kiVblvzKkMv0J8rCy/nG4AfRSoNowZQKQzJu5UOdtmE41UG4Do7bAet7lggUn/d+t9Of
         xp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742780065; x=1743384865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84ZRmXHdIlIW2QrucBXK2LcEOPMw3sQpnxJmzSe2fYY=;
        b=pT10GTCZPTumLUtpJ3K/Zr7/NvHfBrEokqWVbQs76gLIImpatONkipm/i4imyCY7AG
         /iBxP2DBEJVL6vcUCxAgKSYP/Uwj86bEMLMej31uWviI3XrMzpAr72oR1izunqfc/equ
         GY+9u9NCLQ1xgwumpS21F7Bwx4GvzR7o6X3MAudonKdETHD7VdfroJOpnR5wYDcAMb6/
         dIfCyD04VcTrr/VYNAe5GaPrsspSgTNaOrZ4Cvd58sIueiytlrnQc1rNmJstwAj+dRjJ
         gIra4291gf59zdljZjixJ2LrLBdpUCcr9j0EQW5Qd4EDUxmg+I9WkVF/9LbtGzBs9w96
         sUbg==
X-Forwarded-Encrypted: i=1; AJvYcCVSNE+woguERR+4fLO4XhHkYEB+pjYo3SKbpy1wemBouzACHwormlgk459kEPch5wYunLVJexrGm+P6bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/uTLTWfwVE2DQoBVHpfCqZCfV74eRCsiRgj3zZuwphYG9qYtf
	/nfU+HBgjpU98MONbxA3cD7+DH55FEcfooIabk70NnXJ7REnIoSu3dQ/Zw+9sDgva1SYoJp3kkn
	1zXjAcfelCwZSH7OLD6VQBsRMjB0g1HiT67VQjQ==
X-Gm-Gg: ASbGncu9fLxisHryIDeAXIVnmsU9Ygv2dVvzabkJefMaCVByVnl+eJYLOaTUa3llrKD
	7kDLmJ55n1savgexPttBt7uFZpgBLWd9qB+Reab3EI715dkeRemYNOKREzWMt9HP61G2IJFJIHF
	/WKQVEDn2EIo7N+jI1vB6E5ZUqJ6nS+Ufxb7wAOes=
X-Google-Smtp-Source: AGHT+IEBi0qD3dAhIDqlfsTYch80KE3KLMOKPcQ4suA7sZ+2dCIppDWsbTicY5SGje03vIW/RCMO6QwRkXTfi7jsVGg=
X-Received: by 2002:a05:6808:6a89:b0:3f6:729c:810 with SMTP id
 5614622812f47-3febf70248emr7710632b6e.4.1742780065101; Sun, 23 Mar 2025
 18:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250320084428.51151-1-cuiyunhui@bytedance.com> <Z9w3LL8oZixBKM3t@infradead.org>
In-Reply-To: <Z9w3LL8oZixBKM3t@infradead.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 24 Mar 2025 09:34:13 +0800
X-Gm-Features: AQ5f1JrRd8vI7xXgnP8nskMr1xMc7v2sqHXC3TCQNbIuoPpLKlAmWZRVrCNasoA
Message-ID: <CAEEQ3wmKGGW_FnmHrggBoQBCz2OA2EofLtts=hXLmxqdGNGMBA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: introduce the ioremap_prot() function
To: Christoph Hellwig <hch@infradead.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, anshuman.khandual@arm.com, akpm@linux-foundation.org, 
	mingo@kernel.org, catalin.marinas@arm.com, ryan.roberts@arm.com, 
	kirill.shutemov@linux.intel.com, namcao@linutronix.de, bjorn@rivosinc.com, 
	arnd@arndb.de, stuart.menefy@codasip.com, luxu.kernel@bytedance.com, 
	vincenzo.frascino@arm.com, samuel.holland@sifive.com, 
	christophe.leroy@csgroup.eu, dawei.li@shingroup.cn, rppt@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_183426_183938_225A045F 
X-CRM114-Status: GOOD (  16.25  )
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

SGkgQ2hyaXN0b3BoLAoKT24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMTE6NDHigK9QTSBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gPiArewo+ID4gKyAgICAg
cGh5c19hZGRyX3QgYWRkciA9IFBGTl9QSFlTKHBmbik7Cj4gPiArCj4gPiArICAgICAvKiBhdm9p
ZCBmYWxzZSBwb3NpdGl2ZXMgZm9yIGJvZ3VzIFBGTnMsIHNlZSBjb21tZW50IGluIHBmbl92YWxp
ZCgpICovCj4gPiArICAgICBpZiAoUEhZU19QRk4oYWRkcikgIT0gcGZuKQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBtZW1ibG9ja19pc19tYXBfbWVt
b3J5KGFkZHIpOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MKHBmbl9pc19tYXBfbWVtb3J5KTsK
Pgo+IFRoaXMgc2hvdWxkIG5vdCBiZSBleHBvcnRlZCBvciBldmVuIGV4cG9zZWQuICBQbGVhc2Ug
anVzdCBvcGVuIGNvZGUgaXQKPiBpbiB0aGUgb25seSBjYWxsZXIuCj4KPiA+ICt2b2lkIF9faW9t
ZW0gKmlvcmVtYXBfcHJvdChwaHlzX2FkZHJfdCBwaHlzX2FkZHIsIHNpemVfdCBzaXplLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgIHBncHJvdF90IHBncHJvdCkKPiA+ICt7Cj4gPiArICAg
ICAvKiBEb24ndCBhbGxvdyBSQU0gdG8gYmUgbWFwcGVkLiAqLwo+ID4gKyAgICAgaWYgKFdBUk5f
T04ocGZuX2lzX21hcF9tZW1vcnkoX19waHlzX3RvX3BmbihwaHlzX2FkZHIpKSkpCj4gPiArICAg
ICAgICAgICAgIHJldHVybiBOVUxMOwo+Cj4gT3IganVzdCB1c2UgcGZuX3ZhbGlkIGFzIHRoYXQn
cyB3aGF0IHdlIHVzdWFsbHkgdXNlIGZvciB0aGF0IGNoZWNrLgo+IE9yIGFtIEkgbWlzc2luZyBz
b21ldGhpbmcgc3BlY2lmaWMgaGVyZT8KPgo+IEl0IHdvdWxkIGFsc28gYmUgbmljZSB0byBqdXN0
IGxpZmUgdGhpcyB0byBjb21tb24gY29kZS4KClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9u
LiBJIHdhcyBwbGFubmluZyB0byBkbyBqdXN0IHRoYXQuIElmCnBvc3NpYmxlLCBJJ2xsIG1ha2Ug
dGhlIHVwZGF0ZSBpbiB2ZXJzaW9uIDIuCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
