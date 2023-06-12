Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CA3C7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VF9ZmTZVorKg0m+OaKvcvaE2Wt5uVc/vGitQn/ceuNM=; b=IF8B7vqzYZyWGj
	wGkcOng90iJC6oWv7Lmv5wOxR6csuisOAFJcaFiGcagWIXa3TTCqZG3XsdPcGIfRocdRkvHjCBjT4
	v4APzbO0tEJWvinkKOZYXwwC4JUZwt6/606d2xk9eycXob6FarQNAfhXPK9BSaeB2Ccrh5sHZcNZV
	IaENjFuvMyy7b5PKBk7tMFbG2mM6G6KA3tvHOUIedJLhRch5c+QLlo847e4AI2EI3tJ4dhAGD/eFY
	yl4wxK9dOHJVjTS6JMkJfIUjzLOH8IuS9qUXzZQS7kw21dnEVFiOOQxjGa800g/BZOw2JRhWDdIGg
	VQVrbAabDcvTxjcglb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8nUt-005AJ2-1y;
	Mon, 12 Jun 2023 19:46:39 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8nUq-005AI5-0N;
	Mon, 12 Jun 2023 19:46:37 +0000
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso5114790276.0;
        Mon, 12 Jun 2023 12:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686599194; x=1689191194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqdHZRyf0AXNBHWGF0CLQrBOhqQeYTmWOmQD+ocjfOs=;
        b=C3y1ZjLFqaA2btW791/8qFih7w6x5Sr4yexxAk/cbWjvdUHqX4ZJmOq40M091jKh3G
         bQNDv0y5U/uaWDC+gW1IQeVBfTHdgJt4Gze1nrxES4kdm1q7jlBg1IZbi3aXzc660Cxd
         EVu6iOdwf7TxFrX65645AB4DjwrRKJJ++8G9zovbUNc6s+WhLPiSUDGZDQSkYFwDcHxa
         si2bGBzW1SrwRNUV7wphpHxZymo4g2x1u3mm5aqgBtD6QtrMWsyziT2pTFth7UoQkPZi
         MM7MMvAZMQUHFpvlUTrYFXuxI0gTTIXB4tjAgLVFogtdkLJXPOD90LFUQsWr2AE/4gGo
         j7LQ==
X-Gm-Message-State: AC+VfDxjabMhkF0YGB9xNN6iJ0D7tF73NmqzEK0V7T2UpD8rSdBGfkkh
	NmaPRxuEfAnUYX3+owPUhnsiWrlZBwaPYg==
X-Google-Smtp-Source: ACHHUZ7qLSDWwKVylGxwZTd04gW4K9Xk4T+cYhep7fv96lOU8RhOHfKATxpcLdGxW8shkejBfySOeQ==
X-Received: by 2002:a25:32d4:0:b0:bd0:1f43:5618 with SMTP id y203-20020a2532d4000000b00bd01f435618mr698604yby.58.1686599194282;
        Mon, 12 Jun 2023 12:46:34 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id k7-20020a258c07000000b00bb0ae4221b8sm2637261ybl.43.2023.06.12.12.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 12:46:34 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba86ea269e0so5104111276.1;
        Mon, 12 Jun 2023 12:46:34 -0700 (PDT)
X-Received: by 2002:a05:6358:c6a9:b0:12b:db2f:9d2b with SMTP id
 fe41-20020a056358c6a900b0012bdb2f9d2bmr2288064rwb.22.1686598742584; Mon, 12
 Jun 2023 12:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230612172805.681179-1-eric.devolder@oracle.com> <20230612172805.681179-8-eric.devolder@oracle.com>
In-Reply-To: <20230612172805.681179-8-eric.devolder@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jun 2023 21:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
Message-ID: <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
Subject: Re: [PATCH v1 07/21] m68k/kexec: refactor for kernel/Kconfig.kexec
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, 86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, kernel@xen0n.name, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com, 
	keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org, 
	frederic@kernel.org, akpm@linux-foundation.org, ardb@kernel.org, 
	samitolvanen@google.com, juerg.haefliger@canonical.com, arnd@arndb.de, 
	rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org, 
	sebastian.reichel@collabora.com, rppt@kernel.org, 
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, 
	masahiroy@kernel.org, ndesaulniers@google.com, mhiramat@kernel.org, 
	ojeda@kernel.org, thunder.leizhen@huawei.com, xin3.li@intel.com, 
	tj@kernel.org, gregkh@linuxfoundation.org, tsi@tuyoix.net, bhe@redhat.com, 
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com, 
	konrad.wilk@oracle.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_124636_158910_C66F4E78 
X-CRM114-Status: GOOD (  13.96  )
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgNzoyOeKAr1BNIEVyaWMgRGVWb2xkZXIgPGVyaWMuZGV2
b2xkZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gVGhlIGtleGVjIGFuZCBjcmFzaCBrZXJuZWwgb3B0
aW9ucyBhcmUgcHJvdmlkZWQgaW4gdGhlIGNvbW1vbgo+IGtlcm5lbC9LY29uZmlnLmtleGVjLiBV
dGlsaXplIHRoZSBjb21tb24gb3B0aW9ucyBhbmQgcHJvdmlkZQo+IHRoZSBBUkNIX0hBU18gYW5k
IEFSQ0hfU1VQUE9SVFNfIGVudHJpZXMgdG8gcmVjcmVhdGUgdGhlCj4gZXF1aXZhbGVudCBzZXQg
b2YgS0VYRUMgYW5kIENSQVNIIG9wdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIERlVm9s
ZGVyIDxlcmljLmRldm9sZGVyQG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
