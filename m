Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E6EC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/rDMSs5+iY2woHYJMhPSh0mUnR5d595KEHgWmVao7I=; b=skI+iaeTKL91lp
	t5CYQTA+Zow6P9wBaGdHuGvLgWTFi0k5nMaAKmwW24uzuZiVId7m+jNE8/CcrkgTYcUjfkxv5qXpt
	qzQc7LLeVGZnwzWHEIm3shBUxkD/eKK14CCfaErKdNnwBfdYYQqK0xMhL0JzvPPTa66x/rQLrlTYn
	5yxK0Thrv+opWnUCTt+0/tdWn7doLrgPQ5tBRgQ8JEmXuyy09e+H5+jIQ9W4J5SvzkGLfJLd3/LYN
	BhAvrZcoyqd9izkXVhG1dIPdPhEyLyUtDJlTKyvOF3tNqUWygpqYCCcaYti3goI0d1b7h1pyIFI2a
	/Jw5xcleiChpxCl/ZAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgfv-00DUuZ-1q;
	Thu, 18 May 2023 16:40:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgft-00DUtP-1Z
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zgwm1t43SJfpy9DrAiV+ciMDfg3wElSoTQtIFJq3cgU=; b=GEjjdWNzu8p1/+Zwyo1Als6MPf
	BzxJrR1Zog0bxkQeUwd7cy6cZti8ZcdF+RKzLB6jltGDGE7WnBq6Gzjzy0mapdWK9ApbrK8dKd21N
	0rJW9Lm8mIGjFPHSmV/SeWoN4HUHaa6tO4xaVnZ1gT+dEFpu15HXLyVjvSpHirjeE86eNqWCF7IGz
	kMgS8aqHn6xhhJz/DQrCbfnLsS47/DbjEHsSFtP1n+D6vulCkjLrpqCe/xV3p0u66yjmBlMk+qTjZ
	VjUSSnDmBBvXN8YjOxHQyc6s7lLSsUyoZvsS6+f53j6FGEdB8JpJaCVcttljjzZEM2dHfhzkECPrH
	yYsQynJw==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgNH-00ErLT-2S
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:21:09 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d2981e3abso287098b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426865; x=1687018865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgwm1t43SJfpy9DrAiV+ciMDfg3wElSoTQtIFJq3cgU=;
        b=LyM9bhV16q6PUaafI2xVfP/P6GftAZwrqsnAY/9ocZAILuEt68EoHhLyrLnBNgiwY8
         mdEbS8Cv745w6pvBD+bVERM37H23B6k94R+f4dn+tcsczxbm2LcdlWghGtMYi+IwOM/4
         uPXSpwg/fKsKa3rqdcoXou4ru1OC+JNKCh7LfVkO5Jo9E1Gep+cJ1ar4UpiGy6iehbAV
         3U4Hjx1mKN6ePhw8rlKZHMm4rdpmAivPOgwWllE49OevgFtaewRVis3H62WSBmi0bJMb
         CvpoRr/XstvU04g8s6rLfdOCkjVpJhwwOu2KOJdwtro9N2s8tMdz+2ifmgRCDb3NfZ3h
         gHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426865; x=1687018865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zgwm1t43SJfpy9DrAiV+ciMDfg3wElSoTQtIFJq3cgU=;
        b=GsteRav4gTRIJupBJ7BXgsh6P3CuHGX7kmq0D2DwhKGHg7k5fbaFUoVy0zv5wEkIr3
         KWsq0a/rK+rpLeCGIbnL//GD9cdjJLJO8Gn8LCSvWiD3cimWJXcnjFEPwNi+oDGEuC4k
         h3AalcsR8TwKqtE1pK5nVMm9p5stw4fPrlNkj2ZgUwONA89lcz1k+OczxJi61FMFK+1j
         dhLVRYBmZk5csThTYTlEqvB0z2slCVDZylffmWcBFMVPnkrWKQROBLTrW2CzYhVUnInY
         xdGoGzNF/pqa+VzDjCsbzxPcJoLSNDHLzHHSYjqsXEMF1heFy3jag19Z+5Mp4TTRnasG
         /1ag==
X-Gm-Message-State: AC+VfDzy64oYWrLc6xz+Efctv5Fcg/EpW0Apzr9uvLO27+BCqzqUnjm4
	W74WeAKT6MrU1LSI56Unjt37O5gvZAk3bP69hDqcLw14KJnO3P3UWCgGunt874xwAKxs7Xu8zBH
	jhQZUITtzvtoKHaK2qUxlR+S8tjq+ziT/u0vlkVXMK/Gg+/AuFvP8CzelfyIiwSaIWbZCSlO7IW
	GtamTHCMJayiPNbWU=
X-Google-Smtp-Source: ACHHUZ5/uqfj4c5FsQaeIh/+by7OIWeOL9yYb4WWUqPBhdAtvNIA/9TgeTb0VHs89J84EarVxCDTbg==
X-Received: by 2002:a05:6a00:24d1:b0:643:2559:80f3 with SMTP id d17-20020a056a0024d100b00643255980f3mr6553015pfv.2.1684426865160;
        Thu, 18 May 2023 09:21:05 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:21:04 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH -next v20 09/26] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Thu, 18 May 2023 16:19:32 +0000
Message-Id: <20230518161949.11203-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172107_906694_5F1AB653 
X-CRM114-Status: GOOD (  12.36  )
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

RnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KCkFkZCB2ZWN0b3Ig
c3RhdGUgY29udGV4dCBzdHJ1Y3QgdG8gYmUgYWRkZWQgbGF0ZXIgaW4gdGhyZWFkX3N0cnVjdC4g
QW5kCnByZXBhcmUgbG93LWxldmVsIGhlbHBlciBmdW5jdGlvbnMgdG8gc2F2ZS9yZXN0b3JlIHZl
Y3RvciBjb250ZXh0cy4KClRoaXMgaW5jbHVkZSBWZWN0b3IgUmVnZmlsZSBhbmQgQ1NScyBob2xk
aW5nIGR5bmFtaWMgY29uZmlndXJhdGlvbiBzdGF0ZQoodnN0YXJ0LCB2bCwgdnR5cGUsIHZjc3Ip
LiBUaGUgVmVjIFJlZ2lzdGVyIHdpZHRoIGNvdWxkIGJlIGltcGxlbWVudGF0aW9uCmRlZmluZWQs
IGJ1dCBzYW1lIGZvciBhbGwgcHJvY2Vzc2VzLCBzbyB0aGF0IGlzIHNhdmVkIHNlcGFyYXRlbHku
CgpUaGlzIGlzIG5vdCB5ZXQgd2lyZWQgaW50byBmaW5hbCB0aHJlYWRfc3RydWN0IC0gd2lsbCBi
ZSBkb25lIHdoZW4KX19zd2l0Y2hfdG8gYWN0dWFsbHkgc3RhcnRzIGRvaW5nIHRoaXMgaW4gbGF0
ZXIgcGF0Y2hlcy4KCkdpdmVuIHRoZSB2YXJpYWJsZSAoYW5kIHBvdGVudGlhbGx5IGxhcmdlKSBz
aXplIG9mIHJlZ2ZpbGUsIHRoZXkgYXJlCnNhdmVkIGluIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBt
ZW1vcnksIHBvaW50ZWQgdG8gYnkgZGF0YXAgcG9pbnRlciBpbgpfX3Jpc2N2X3ZfZXh0X3N0YXRl
LgoKQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
PgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxs
LmV1PgpUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4K
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgfCA5NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgg
fCAxNyArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oCmluZGV4IGRmM2I1Y2FlY2M4Ny4uM2MyOWY0ZWI1NTJhIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdmVjdG9yLmgKQEAgLTExLDggKzExLDEwIEBACiAKICNpZmRlZiBDT05GSUdfUklTQ1Zf
SVNBX1YKIAorI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgogI2luY2x1ZGUgPGFzbS9od2Nh
cC5oPgogI2luY2x1ZGUgPGFzbS9jc3IuaD4KKyNpbmNsdWRlIDxhc20vYXNtLmg+CiAKIGV4dGVy
biB1bnNpZ25lZCBsb25nIHJpc2N2X3ZfdnNpemU7CiBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2
b2lkKTsKQEAgLTIyLDYgKzI0LDI2IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNf
dmVjdG9yKHZvaWQpCiAJcmV0dXJuIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1Zf
SVNBX0VYVF92KTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3RhdGVfY2xl
YW4oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJcmVncy0+c3RhdHVzID0gKHJlZ3MtPnN0YXR1
cyAmIH5TUl9WUykgfCBTUl9WU19DTEVBTjsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHJpc2N2
X3ZfdnN0YXRlX29mZihzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlyZWdzLT5zdGF0dXMgPSAo
cmVncy0+c3RhdHVzICYgflNSX1ZTKSB8IFNSX1ZTX09GRjsKK30KKworc3RhdGljIGlubGluZSB2
b2lkIHJpc2N2X3ZfdnN0YXRlX29uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCXJlZ3MtPnN0
YXR1cyA9IChyZWdzLT5zdGF0dXMgJiB+U1JfVlMpIHwgU1JfVlNfSU5JVElBTDsKK30KKworc3Rh
dGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHN0cnVjdCBwdF9yZWdzICpyZWdz
KQoreworCXJldHVybiAocmVncy0+c3RhdHVzICYgU1JfVlMpICE9IDA7Cit9CisKIHN0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgdm9pZCByaXNjdl92X2VuYWJsZSh2b2lkKQogewogCWNzcl9zZXQoQ1NS
X1NTVEFUVVMsIFNSX1ZTKTsKQEAgLTMyLDEzICs1NCw4NiBAQCBzdGF0aWMgX19hbHdheXNfaW5s
aW5lIHZvaWQgcmlzY3Zfdl9kaXNhYmxlKHZvaWQpCiAJY3NyX2NsZWFyKENTUl9TU1RBVFVTLCBT
Ul9WUyk7CiB9CiAKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0ZV9jc3Jfc2F2
ZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqZGVzdCkKK3sKKwlhc20gdm9sYXRpbGUgKAor
CQkiY3NycgklMCwgIiBfX3N0cmluZ2lmeShDU1JfVlNUQVJUKSAiXG5cdCIKKwkJImNzcnIJJTEs
ICIgX19zdHJpbmdpZnkoQ1NSX1ZUWVBFKSAiXG5cdCIKKwkJImNzcnIJJTIsICIgX19zdHJpbmdp
ZnkoQ1NSX1ZMKSAiXG5cdCIKKwkJImNzcnIJJTMsICIgX19zdHJpbmdpZnkoQ1NSX1ZDU1IpICJc
blx0IgorCQk6ICI9ciIgKGRlc3QtPnZzdGFydCksICI9ciIgKGRlc3QtPnZ0eXBlKSwgIj1yIiAo
ZGVzdC0+dmwpLAorCQkgICI9ciIgKGRlc3QtPnZjc3IpIDogOik7Cit9CisKK3N0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0ZV9jc3JfcmVzdG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4
dF9zdGF0ZSAqc3JjKQoreworCWFzbSB2b2xhdGlsZSAoCisJCSIub3B0aW9uIHB1c2hcblx0Igor
CQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCisJCSJ2c2V0dmwJIHgwLCAlMiwgJTFcblx0IgorCQki
Lm9wdGlvbiBwb3Bcblx0IgorCQkiY3NydwkiIF9fc3RyaW5naWZ5KENTUl9WU1RBUlQpICIsICUw
XG5cdCIKKwkJImNzcncJIiBfX3N0cmluZ2lmeShDU1JfVkNTUikgIiwgJTNcblx0IgorCQk6IDog
InIiIChzcmMtPnZzdGFydCksICJyIiAoc3JjLT52dHlwZSksICJyIiAoc3JjLT52bCksCisJCSAg
ICAiciIgKHNyYy0+dmNzcikgOik7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3Zf
dnN0YXRlX3NhdmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnNhdmVfdG8sCisJCQkJCSB2
b2lkICpkYXRhcCkKK3sKKwl1bnNpZ25lZCBsb25nIHZsOworCisJcmlzY3Zfdl9lbmFibGUoKTsK
KwlfX3ZzdGF0ZV9jc3Jfc2F2ZShzYXZlX3RvKTsKKwlhc20gdm9sYXRpbGUgKAorCQkiLm9wdGlv
biBwdXNoXG5cdCIKKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0IgorCQkidnNldHZsaQklMCwgeDAs
IGU4LCBtOCwgdGEsIG1hXG5cdCIKKwkJInZzZTgudgkJdjAsICglMSlcblx0IgorCQkiYWRkCQkl
MSwgJTEsICUwXG5cdCIKKwkJInZzZTgudgkJdjgsICglMSlcblx0IgorCQkiYWRkCQklMSwgJTEs
ICUwXG5cdCIKKwkJInZzZTgudgkJdjE2LCAoJTEpXG5cdCIKKwkJImFkZAkJJTEsICUxLCAlMFxu
XHQiCisJCSJ2c2U4LnYJCXYyNCwgKCUxKVxuXHQiCisJCSIub3B0aW9uIHBvcFxuXHQiCisJCTog
Ij0mciIgKHZsKSA6ICJyIiAoZGF0YXApIDogIm1lbW9yeSIpOworCXJpc2N2X3ZfZGlzYWJsZSgp
OworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHN0cnVj
dCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpyZXN0b3JlX2Zyb20sCisJCQkJCSAgICB2b2lkICpkYXRh
cCkKK3sKKwl1bnNpZ25lZCBsb25nIHZsOworCisJcmlzY3Zfdl9lbmFibGUoKTsKKwlhc20gdm9s
YXRpbGUgKAorCQkiLm9wdGlvbiBwdXNoXG5cdCIKKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0Igor
CQkidnNldHZsaQklMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKKwkJInZsZTgudgkJdjAsICgl
MSlcblx0IgorCQkiYWRkCQklMSwgJTEsICUwXG5cdCIKKwkJInZsZTgudgkJdjgsICglMSlcblx0
IgorCQkiYWRkCQklMSwgJTEsICUwXG5cdCIKKwkJInZsZTgudgkJdjE2LCAoJTEpXG5cdCIKKwkJ
ImFkZAkJJTEsICUxLCAlMFxuXHQiCisJCSJ2bGU4LnYJCXYyNCwgKCUxKVxuXHQiCisJCSIub3B0
aW9uIHBvcFxuXHQiCisJCTogIj0mciIgKHZsKSA6ICJyIiAoZGF0YXApIDogIm1lbW9yeSIpOwor
CV9fdnN0YXRlX2Nzcl9yZXN0b3JlKHJlc3RvcmVfZnJvbSk7CisJcmlzY3Zfdl9kaXNhYmxlKCk7
Cit9CisKICNlbHNlIC8qICEgQ09ORklHX1JJU0NWX0lTQV9WICAqLwogCiBzdHJ1Y3QgcHRfcmVn
czsKIAogc3RhdGljIGlubGluZSBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2b2lkKSB7IHJldHVy
biAtRU9QTk9UU1VQUDsgfQogc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc192ZWN0b3Io
dm9pZCkgeyByZXR1cm4gZmFsc2U7IH0KK3N0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0
ZV9xdWVyeShzdHJ1Y3QgcHRfcmVncyAqcmVncykgeyByZXR1cm4gZmFsc2U7IH0KICNkZWZpbmUg
cmlzY3Zfdl92c2l6ZSAoMCkKKyNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpCQlkbyB7
fSB3aGlsZSAoMCkKKyNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykJCQlkbyB7fSB3aGls
ZSAoMCkKIAogI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JU0FfViAqLwogCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vcHRyYWNlLmgKaW5kZXggODgyNTQ3ZjZiZDVjLi41ODY3ODZkMDIzYzQgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaAorKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKQEAgLTc3LDYgKzc3LDIzIEBAIHVuaW9uIF9f
cmlzY3ZfZnBfc3RhdGUgewogCXN0cnVjdCBfX3Jpc2N2X3FfZXh0X3N0YXRlIHE7CiB9OwogCitz
dHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSB7CisJdW5zaWduZWQgbG9uZyB2c3RhcnQ7CisJdW5z
aWduZWQgbG9uZyB2bDsKKwl1bnNpZ25lZCBsb25nIHZ0eXBlOworCXVuc2lnbmVkIGxvbmcgdmNz
cjsKKwl2b2lkICpkYXRhcDsKKwkvKgorCSAqIEluIHNpZ25hbCBoYW5kbGVyLCBkYXRhcCB3aWxs
IGJlIHNldCBhIGNvcnJlY3QgdXNlciBzdGFjayBvZmZzZXQKKwkgKiBhbmQgdmVjdG9yIHJlZ2lz
dGVycyB3aWxsIGJlIGNvcGllZCB0byB0aGUgYWRkcmVzcyBvZiBkYXRhcAorCSAqIHBvaW50ZXIu
CisJICoKKwkgKiBJbiBwdHJhY2Ugc3lzY2FsbCwgZGF0YXAgd2lsbCBiZSBzZXQgdG8gemVybyBh
bmQgdGhlIHZlY3RvcgorCSAqIHJlZ2lzdGVycyB3aWxsIGJlIGNvcGllZCB0byB0aGUgYWRkcmVz
cyByaWdodCBhZnRlciB0aGlzCisJICogc3RydWN0dXJlLgorCSAqLworfTsKKwogI2VuZGlmIC8q
IF9fQVNTRU1CTFlfXyAqLwogCiAjZW5kaWYgLyogX1VBUElfQVNNX1JJU0NWX1BUUkFDRV9IICov
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
