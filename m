Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkccQ8S+ZBxs2JYBLVZ6pmexIfnHTZOnrcQN1rB+dVg=; b=Obn/RE+oNn5LHX
	LXotV4opbaupiBcQ9D2xEIYoZOKF9N/y7qZVkmqfJkCychi2BOOtCyXxWy6R3/QrprSb/Jbg/EUn8
	6nEt2wCxIrtJv5wxWthnjCwuUZV5lcpbm7o1yyh3ifW4d6jb8lcnH6mvSYXCCT71HW5m/o59QNzoi
	Z02sfhDH+/WCEoLpzW7GquPFWPPNEvGczJYEjBjT2EMkcRSYUxIFPQJa28FlKPfHr+q5OFFh6+xA1
	4tPK2MXHcPIHFT/OHjXFunJX4eq3Zrdbz+hJtqJvx7fvXtykUC0cWJ07rhNReBC8ymh225+vx9Nad
	LZuz0QkqqAy7NSABuGPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb2km-0000000Guox-3moj;
	Mon, 05 Aug 2024 18:48:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb2kj-0000000Gumh-1UBz
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 18:48:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fda7fa60a9so100113715ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722883696; x=1723488496; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWiE5Gt/81O/McaIBD85wwCe3mZnLm7BjL3ftw4B+HM=;
        b=yQtOC23V20lkLQLV0kgCz3ZeQ2MA0dfqqTaQdQ7TlqrUn+lpugeBVz08kviPOn/C12
         WVakmOT8VHXK0HtqCkAr8wqFp30phrHxcu534IyaaO/cf0fn1XeseEteqEgyjv+zuWxS
         FfEg/+UvkLsh2ON7PFTGDY7nJODJCgDvYf+c4/eL32o7KX3oFp345359kLyx1HsMNxDj
         CO4bhDfobHYTzPXOFGkVLgCrFEBOow8JsA+511FB6+LjvoTSX7NV81UWxN6QKXoSQhLk
         ZItophI4YoarZnd3t9o/pAAYgfnIrdpaFE485DPF/Bjc1bsRUNJmDw5SohuXt2rHLOy7
         0h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722883696; x=1723488496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWiE5Gt/81O/McaIBD85wwCe3mZnLm7BjL3ftw4B+HM=;
        b=gx5kWXmbIJiO6Hi/A46zMwFmbVPug8nLGJQOcSgxYWbW41Q/VHVjoPPdXCVnK3Wsbz
         7pEMLmDJSuy/kiYyX6wi8JFEvChoUtvKKpRtQrlZyXFAL3Ymc4zoAw8LM7rDJi9C4ZKW
         QmMyOEpGRMdhQvcvx3klxRYF12w/gE+CfL9Tq6Tdqv3dNSnmMoaOBfaOyEcFt7IjtThO
         5TBWfqP91IWbxbNIJvZ6BbT+7+yyS/MzSXooTFgWmnZx+9Ib5IbrndLRXobb0HRdxauS
         DsaPFUUdnGoWHjtMcURCrqrLe6gOzu9ZSx6mkQyi28OEjdjGE2H1a3GnQ+tiOStJoDE3
         vrbA==
X-Forwarded-Encrypted: i=1; AJvYcCUoEZdu7cVxtLIFYvBXj404Ud4DgWtXwOvjGEzU7ioaUnx+uSZev2IQBUY0umDi6HKXGsyq5RxqLkzUAlhEgZu8MZPFoEFPl98h5nCAFci/
X-Gm-Message-State: AOJu0Yy0uTMgNnoooR6AVs7eASYfyFt2nop4lRn/mx1xIKPJRnOqs7Xx
	+Ltdsn64W8ROsBaMd4+tXfLSAJDMnZwWccanhrXAkdgL6kciDPAmKGRDLz5YBm0=
X-Google-Smtp-Source: AGHT+IFlG8VhZGgwoNGP9WjMsD0WO4HK22QdL7Ggcd2eSX0CNB+lJyh9+cv8ryXXl69OuOhZ/LNPNg==
X-Received: by 2002:a17:902:c949:b0:1fd:6bfa:f59 with SMTP id d9443c01a7336-1ff572743b3mr140884975ad.19.1722883695945;
        Mon, 05 Aug 2024 11:48:15 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592b3643sm71467005ad.290.2024.08.05.11.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 11:48:15 -0700 (PDT)
Date: Mon, 5 Aug 2024 11:48:12 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
Message-ID: <ZrEebH2wdjRgfYCB@ghost>
References: <20240805173816.3722002-1-jesse@rivosinc.com>
 <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_114817_417237_134517BB 
X-CRM114-Status: GOOD (  21.57  )
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

T24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMTE6Mzg6MjNBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBNb24sIEF1ZyA1LCAyMDI0IGF0IDEwOjM44oCvQU0gSmVzc2UgVGF1YmUgPGplc3Nl
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWRkIGEga2VybmVsIHBhcmFtZXRlciB0byB0
aGUgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZC4gVGhpcyBhbGxvd3MKPiA+IHNraXBpbmcgb2YgdGhl
IHNwZWVkIHRlc3RzIGZvciB1bmFsaWduZWQgYWNjZXNzZXMsIHdoaWNoIG9mdGVuIGlzIHZlcnkK
PiA+IHNsb3cuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9z
aW5jLmNvbT4KPiAKPiBIb3cgY29tZSB0aGlzIGlzIGEgY29tbWFuZCBsaW5lIHBhcmFtZXRlciBy
YXRoZXIgdGhhbiBhIEtjb25maWcKPiBvcHRpb24/IEkgY291bGQgYmUgd3JvbmcsIHNvIEknbGwg
bGF5IG91dCBteSByYXRpb25hbGUgYW5kIHBlb3BsZSBjYW4KPiBwaWNrIGl0IGFwYXJ0IGlmIEkn
dmUgZ290IGEgYmFkIGFzc3VtcHRpb24uCj4gCj4gSSB0aGluayBvZiBjb21tYW5kbGluZSBwYXJh
bWV0ZXJzIGFzIChtb3N0bHkpIHNvbWV0aGluZyBlbmQgdXNlcnMKPiB0d2lkZGxlIHdpdGgsIHZl
cnN1cyBrY29uZmlnIG9wdGlvbnMgYXMgc29tZXRoaW5nIHN5c3RlbSBidWlsZGVycyBzZXQKPiB1
cC4gSSdkIGxhcmdlbHkgZXhwZWN0IGVuZCB1c2VycyBub3QgdG8gbm90aWNlIHR3byB0aWNrcyBh
dCBib290IHRpbWUuCj4gSSdkIGV4cGVjdCBpdHMgc3lzdGVtIGJ1aWxkZXJzIGFuZCBmbGVldCBt
YW5hZ2Vycywgd2hvIGtub3cgdGhlaXIKPiBoYXJkd2FyZSBhbmQgYnVpbGQgdGhlaXIga2VybmVs
cyBvcHRpbWl6ZWQgZm9yIGl0LCBhcmUgdGhlIG9uZXMgd2hvCj4gd291bGQgd2FudCB0byBzaGF2
ZSBvZmYgdGhpcyB0aW1lIGFuZCBnbyBzdHJhaWdodCB0byB0aGUga25vd24gYW5zd2VyLgo+IEFu
ZWNkb3RhbGx5LCBhdCBDaHJvbWVPUyB3ZSBoYWQgYSBzdHJvbmcgcHJlZmVyZW5jZSBmb3IgS2Nv
bmZpZwo+IG9wdGlvbnMsIGFzIHRoZXkgd2VyZSBlYXNpZXIgdG8gY29tcG9zZSBhbmQgbWFpbnRh
aW4gdGhhbiBhIGxvb3NlIHBpbGUKPiBvZiBjb21tYW5kbGluZSBhcmd1bWVudHMuCj4gCj4gVGhl
IGNvbW1pdCB0ZXh0IGRvZXNuJ3QgZ28gaW50byB0aGUgcmF0aW9uYWxlLCBpbnRlbmRlZCBhdWRp
ZW5jZSwgb3IKPiBleHBlY3RlZCB1c2FnZSwgc28gbWF5YmUgbXkgZ3Vlc3NlcyBtaXNzIHRoZSBt
YXJrIG9uIHdoYXQgeW91J3JlCj4gdGhpbmtpbmcuCj4gLUV2YW4KClRoZXJlIHdhcyBhIGJyaWVm
IGRpc2N1c3Npb24gYWJvdXQgdGhpcyBvbiBKZXNzZSdzIHNlcmllcyBhYm91dCB2ZWN0b3IKdW5h
bGlnbmVkIHN1cHBvcnQgWzFdLiBUaGUgb3JpZ2luYWwgaWRlYSB3YXMgdG8gdXNlIFppY2Nsc20g
dG8gYWxsb3cKcGVvcGxlIHRvIHNldCB0aGUgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCBvbiBwcmUt
Y29tcGlsZWQgZGlzdHJvIGtlcm5lbHMuCkhvd2V2ZXIgWmljY2xzbSBpc24ndCB1c2VmdWwgc28g
dGhlIGFsdGVybmF0aXZlIHJvdXRlIHdhcyB0byB1c2UgYQprZXJuZWwgYXJnLiBUaGVyZSBpcyBh
bHJlYWR5IHN1cHBvcnQgZm9yIGEgS2NvbmZpZywgdGhlIGtlcm5lbCBhcmcgaXMKanVzdCBhbm90
aGVyIG9wdGlvbiBmb3IgdXNlcnMuCgpMaW5rOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
L2FmMzE1MmI2LWFkZjctNDBmYS1iMmExLTg3ZTY2ZWVjNDViMEByaXZvc2luYy5jb20vClsxXQoK
LSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
