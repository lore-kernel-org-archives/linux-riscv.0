Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1FDC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlsZkvcPGaA8uGD+BccG/12C1kEv0t/AXf55T/xrmG8=; b=spi3lWRgjunYp9
	m1cCH5rTRnLD8VFlc5S38bly6eMbaXL/394RAGu6v5a48giY7QdrdTB/XA+pAnmHLlMbF/32DtI9E
	R7rTYNRBfylRa69pLs6qiuQNrXlFWu6g1Taay/vOxoGrxzj4SehVH+hgJRzBPEV+ITLiPk56PJ/Il
	YAhaDY5pRbY8LZ2ctn2KXbDC6Jiw7W64Elyd8gUcMmEbTTAy91DqrR21Kw6+8/v/ADtjx4VeEH5cc
	M6hGeo0Te/2A6ZeTJUD382ZJp+cLNnf2ukX6SsyyvWfz+wrj/3NGQUW8QgWEU0ctBtFvSPO4bwJQ4
	1QmxzV5QwKyduS92Z4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOdSP-00AJdo-2N;
	Wed, 26 Jul 2023 12:17:33 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOdSM-00AJcx-1B
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 12:17:32 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1bba1816960so1085678fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 05:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1690373848; x=1690978648;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0PSB6Q4tQ0VbeXGuwPR8oxpl0KqMEC65BPmeAh9GDM=;
        b=G05f6CZe5H/9IGsFUzRc8wADFR0C472XZD5MzGbH2v3Z9Z0EiZdKBGI5zqU3T3dQCA
         AvCK9JYcta0Jzsvlmo7hAbvSjG0FCtCG9XhV+XFKEdZySfo+1Tk+7Ja+G2eig3OqNtCy
         MdWWpPFPDJI4rm2w5wxnP6qS59yUxxo9v9sIoAxEYeWkR+LTpC8cic+YxfENN0BtJXmE
         rnUCjNbgVhpgF+qYxtHe9DXvPTY9EC93G9QoEF3zJlzgxSLh0Pp7uO//A3gCkIeiLNav
         C+f1t29bNFYt7fPydYq+G50UxWkDGM5m+D0p7DFMD9wr8SlitZ3sHdA7fYyrYe6YS/yy
         7kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690373848; x=1690978648;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0PSB6Q4tQ0VbeXGuwPR8oxpl0KqMEC65BPmeAh9GDM=;
        b=S7tTxPyGZQ9O+20P3+V/g69ZrIv17NhRrriHcaGjt82fdZD5wuGpakC60qYfBTbmBX
         Twf/Rqf8QXOLEpc81MPkL1oOqH6Hgpz+m2man8zry6OX3/8odLQoTaE/5YPPtH6JqWz8
         dmtOD9ufWaDZzh3QCkd5TT9jDJPqifqoXriETNWeEKmgYFVR1/SCnPF0Yy2G8xjsprcW
         y+n7VbJnwIHkcMRgXq/yPBxWF38LX+9CCKNZciWn/K9LkyJ+bn13c9EjO6iWClm4IPos
         gBpNDMete5MSfnyvxEJvTaZck9dQSW3m78Nr3jwegiAo/mTguz/GFjdLjGuRqBvs2DN7
         j3Mg==
X-Gm-Message-State: ABy/qLY7W31M8m9rsmGseC9dW0F92T2nU4Zsi0d7oATfpvXG910Et+tW
	NpsIw/hVXLcd0XpeWBnb+aS+IA==
X-Google-Smtp-Source: APBJJlER/vAICvmtsZSZspI3r1Rtl4DeBU/8Xh5ht8tNl2f1NYU+kdczAWKMT7jUT8bkQnv76vuP2g==
X-Received: by 2002:a05:6870:1fc3:b0:1bb:5756:3c06 with SMTP id gp3-20020a0568701fc300b001bb57563c06mr2013185oac.53.1690373847896;
        Wed, 26 Jul 2023 05:17:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id w10-20020ac86b0a000000b003f9c6a311e1sm4731716qts.47.2023.07.26.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 05:17:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qOdSI-000uxy-Jm;
	Wed, 26 Jul 2023 09:17:26 -0300
Date: Wed, 26 Jul 2023 09:17:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
Message-ID: <ZMEO1kNGfGjN6kZM@ziepe.ca>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <d62ceb33620cab766d809e6bbf30eaf5b46bc955.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0r=2eqpy9wLjVt1U0J7=LpnJLcKV7N9d90jvCss=7+Fzg@mail.gmail.com>
 <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
 <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com>
 <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_051730_690926_E228919B 
X-CRM114-Status: GOOD (  19.12  )
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

T24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMTI6MjY6MTRQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
PiBPbiBXZWQsIEp1bCAyNiwgMjAyMyBhdCAxMToyMeKAr0FNIEJhb2x1IEx1IDxiYW9sdS5sdUBs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjMvNy8yNCAyMToyMywgWm9uZyBM
aSB3cm90ZToKPiA+ID4+Pj4+IEluIFJJU0MtViBJT01NVSwgY2VydGFpbiBkZXZpY2VzIGNhbiBi
ZSBzZXQgdG8gYnlwYXNzIG1vZGUgd2hlbiB0aGUKPiA+ID4+Pj4+IElPTU1VIGlzIGluIHRyYW5z
bGF0aW9uIG1vZGUuIFRvIGlkZW50aWZ5IHRoZSBkZXZpY2VzIHRoYXQgcmVxdWlyZQo+ID4gPj4+
Pj4gYnlwYXNzIG1vZGUgYnkgZGVmYXVsdCwgZG9lcyBpdCBiZSBzZW5zaWJsZSB0byBhZGQgYSBw
cm9wZXJ0eSB0bwo+ID4gPj4+Pj4gaW5kaWNhdGUgdGhpcyBiZWhhdmlvcj8KPiA+ID4+Pj4gQnlw
YXNzIG1vZGUgZm9yIGEgZGV2aWNlIGlzIGEgcHJvcGVydHkgb2YgdGhhdCBkZXZpY2UgKHNpbWls
YXIgdG8gZG1hLWNvaGVyZW50KQo+ID4gPj4+PiBhbmQgbm90IG9mIHRoZSBJT01NVS4gT3RoZXIg
YXJjaGl0ZWN0dXJlcyAoQVJNIGFuZCB4ODYpIG5ldmVyIGFkZGVkIHN1Y2gKPiA+ID4+Pj4gYSBk
ZXZpY2UgcHJvcGVydHkgZm9yIGJ5cGFzcyBtb2RlIHNvIEkgZ3Vlc3MgaXQgaXMgTk9UIEFEVklT
QUJMRSB0byBkbyBpdC4KPiA+ID4+Pj4KPiA+ID4+Pj4gSWYgdGhpcyBpcyBSRUFMTFkgcmVxdWly
ZWQgdGhlbiB3ZSBjYW4gZG8gc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhlIFFDT00KPiA+ID4+Pj4g
U01NVSBkcml2ZXIgd2hlcmUgdGhleSBoYXZlIGEgd2hpdGVsaXN0IG9mIGRldmljZXMgd2hpY2gg
YXJlIGFsbG93ZWQgdG8KPiA+ID4+Pj4gYmUgaW4gYnlwYXNzIG1vZGUgKGkuZS4gSU9NTVVfRE9N
QUlOX0lERU5USVRZKSBiYXNlZCB0aGVpciBkZXZpY2UKPiA+ID4+Pj4gY29tcGF0aWJsZSBzdHJp
bmcgYW5kIGFueSBkZXZpY2Ugb3V0c2lkZSB0aGlzIHdoaXRlbGlzdCBpcwo+ID4gPj4+PiBibG9j
a2VkIGJ5IGRlZmF1bHQuCgpJIGhhdmUgYSBkcmFmdCBwYXRjaCBzb21lcGxhY2UgdGhhdCBjb25z
b2xpZGF0ZWQgYWxsIHRoaXMgcXVpcmsKY2hlY2tpbmcgaW50byB0aGUgY29yZSBjb2RlLiBHZW5l
cmFsbHkgdGhlIGV4cGVjdGF0aW9uIGlzIHRoYXQgYW55CmRldmljZSBiZWhpbmQgYW4gaW9tbXUg
aXMgZnVsbHkgZnVuY3Rpb25hbCBpbiBhbGwgbW9kZXMuIFRoZSBleGlzdGluZwpxdWlya3MgYXJl
IGZvciBIVyBkZWZlY3RzIHRoYXQgbWFrZSBzb21lIGRldmljZXMgbm90IHdvcmsgcHJvcGVybHku
IEluCnRoaXMgY2FzZSB0aGUgcmlnaHQgb3V0Y29tZSBzZWVtcyB0byBiZSBlZmZlY3RpdmVseSBi
bG9ja2luZyB0aGVtIGZyb20KdXNpbmcgdGhlIGlvbW11LgoKU28sIHlvdSBzaG91bGQgZXhwbGFp
biBhIGxvdCBtb3JlIHdoYXQgInJlcXVpcmUgYnlwYXNzIG1vZGUiIG1lYW5zIGluCnRoZSBSSVND
ViB3b3JsZCBhbmQgd2h5IGFueSBkZXZpY2Ugd291bGQgbmVlZCBpdC4KCkphc29uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
