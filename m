Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E9D3F07D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGrBbUMBhp0z1o9ZbpPcc9SY+F1gGLwwHm7aHMGrebI=; b=ONT50byhmXJxDp
	rVjKUAKQ6xYmo3h71SxfUXDJJzd7NzHcdStF57CNiTHk+gQUodtfUhLVhiJ8IgBuBTwHnMxswOBYY
	MHMGwvpjn2ngyFsGTkYmzBMOQpusseEiqmhSL27p2izryiHgbv3m133RyOx2U5iPWcPUquu0rzEXe
	mYuXiJSnRefsdbTz95UAytpQOlMNeSSNSxjmZP4gRlCh7NcL4ZgLYi7G6VbF28S1jP4iOvClacBtS
	kEbVjjo5WKmkg3gDQn3xGCh72hqHSnoxArUuFCg9PtnGx2wFdewxK8GMlm55S4foMjDjVmb5opI76
	jlajwqU1WFJVap+n2Tzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AJ-0000000GFBC-3Qqj;
	Wed, 28 Jan 2026 15:09:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AI-0000000GFB2-43WF
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Jan 2026 15:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xImSaumXjiTjPnMx4RKwPEYhdrOmxFBV6+72e58SeRA=; b=ZbM3Bl5gXhBDMfdir5bnnqKmNg
	AD6TfTkrIKzaAihruJILQOe+uEfck3pyHvPCLIZG5rCUnp0p0+SQS9xoB91y4TkFheaCvrIoiN/GH
	qZLpxOnUN+b+8ITKVH7kzK6H6bh5WdUv097KgsYMRQ6ejBckBsXwIsf4tFZ0SjyTtb1Sq6tHpcxNA
	h1PW7igWz0FMyFMCg7Y4RdV8UtbjeaYOS9Nkd3mLzYtLfGY8hER693kU5YtMaIFk3MsgYFp2/XnUN
	zLF/9QXQjqZxsoQlHDZSjRknnueWETH8hfADNLdusCcoCVl2DmSLRkY0YuvDWvd4O/heUiqC4+XxS
	qeHWdvxg==;
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AF-00000008nzh-081N
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 15:09:05 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-404263bd58fso597697fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 07:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769612940; cv=none;
        d=google.com; s=arc-20240605;
        b=CxQRr3CR0/Yxh5tS4l5/AE5sLVv3bjh3g1Oupn9jS5sP4ZFePyc5X+KibSlAmA0k1w
         BP3R539guw+iborE+blffReiD7I//RpDOfXlH9WIcLuJ4bQHaEzIH63IijofebY28bNf
         Y8UEnB8wm08ucLr9DfQ3oezn32nDtZKsBVklD+iX1shUsXFpt9n05x44hlooFKLzEvkG
         DAfvPejP14r80DPppqe7iDhAwY4SCSULZqRYn/DmsYNCx4fYmrkFgFGMNPt4DOUBlES8
         ILt6ZhOEavHVcSOBS5F5Y5vIQZAfuUEd2v4V8xoV5fDJaf4KIWatXsFIlDUXv7FkhEny
         GwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xImSaumXjiTjPnMx4RKwPEYhdrOmxFBV6+72e58SeRA=;
        fh=vrGXMYnUAoWkHRyN1JLSituKwRC4UDNd03pivomR4s8=;
        b=l1O53GdpYOm+4Kh1m4UWvnMPSg7ciis0B2A1CO7OnTmqOT8RTJFTUbVspUyme6Pxoy
         jJ4a4qdj2oUF5gcFgdZF2PNJrxsdHX0AUhEUU5HuoGqCxoggQ3P46e1FE7vnNNOPDtJ6
         mICtq0CODQmly7SdBDYmedZS72BYRKwhSgrq4/KfLm+mAC2ogUHJ4LbaGdwJzwkusFQP
         rdVUJ3aDWV1F3use5nxLIeyxw5rjFmgTwe8zAJQW5kH3CIa3SikB569u8gxlKq0+Gq7t
         MKypo5Ed1WEbo3zyZWHnMKavbT62uDaShlgFMDJpQfiuaw+5xhbaE6BuAGhrzOVpZyEd
         qI6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769612940; x=1770217740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xImSaumXjiTjPnMx4RKwPEYhdrOmxFBV6+72e58SeRA=;
        b=bJEmsHBOBYgPxETl0ckXo/+SgWzNdetqCrquZtz0RgPS/rJqhuEdtpAPjFRth4GXc0
         qjF8s36JgiUpEGrMqqzbP+CCyBjQcNIzwggfMTn4fVXSZQAVLbj/IlZFAAX07fBSWWjM
         5LQnRbaWaEbgECjc8dEwDxkEUfYaussk1lBILS8KmI/u1D6fv0PEf2+kJXgNAKwokLE1
         TJ0VG9JOXMT9VbAwMVPfOE4feykV2npkvg709QpDpcSflXyMAh/JDcGqW4reuRtXy/sZ
         hR9AtkoLuCVal2YNcwakrL2I5utezfWkSPQRm00ald4v72QZVF21FzYD0ZTgKzNTacl0
         DjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612940; x=1770217740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xImSaumXjiTjPnMx4RKwPEYhdrOmxFBV6+72e58SeRA=;
        b=C+W5VaCrjEEE2w7gtHQuvHYU9qAiVneU2tRDjdligp7N5C4vYQERDG6kGy9FfgnTau
         G6TQGzKGrGunTQ56EAJb8hhKgiMlITMab0uPc3Wfa+eWL0by1HWVcxtA9WDcG7Lo3b0T
         loQiFZfOIqhwYHEinYvyYEaaD+Z4BVyyrOE5xeF8tMwjnSzNNEhGdbhtgEQM3lCLSDFm
         +wiBXul6J34DsomRUStyxFmT0JsA16tTRF6l6Hhc1q5TxDirysgha1hfm0BsI3az09yF
         oCQa8go8yZxv8ac7cwFk9OszTop1H1avF4gd6jKxRBgDqYUpzWcsKanPBbjhSDE0oZXp
         4sFg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Ab+YHCOleoQnDGok2wr8ahBgER/4RGTppmyCF9E/bYLwaYOESQGPy8IphyAP6YQ/G28RvfiaI4Updg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXbzKKHpn3o0ARb4StUVAXp17K4/VVDIIdJSvhISpqF2LhXzoZ
	JvMGwhjEh+VUdV0GEpEMVnX1HrPbJhmKA5IJrH/HERVHsrlXnaH5reVoJ0FZCtNA5ZdM6QLRidt
	njFSgJG3SoXcZQuKzreyT+utGVWujs6heN8AcNxNb8w==
X-Gm-Gg: AZuq6aJFQz4ODVtxP0L+VPkldYZ1FuJyKQ73d4or5YroJAgRZD8XFjhYTqr31cNOHiW
	V0EVJ323FjIZ3DPRzLXEG/gpbvHh3tBYvVBISMtl8+oWR9jkekSRHl/Ng5zexryuE9qvciykSSj
	CCz3RnsRjtXgCW1MMj0aGAeXvhFZE4wcxSYQJIzzw/jfRyXmkM/pFVTejoKrM/mzRj/AjM0AEKY
	FOvLCjiL7lAWlSLKtE003zgyRJ3jsRIfc+fShncyDZqNC+VCkXgC7jGopbn7flQf5TtuEkPSyhg
	WZtPjsaLmk09MINJYmJCRqlaDR6M5siDoZsVluPGQmIN5RNaztOjtBNJ2gE=
X-Received: by 2002:a05:6820:1c9f:b0:662:fb9f:9562 with SMTP id
 006d021491bc7-662fb9f97b2mr1829587eaf.36.1769612940354; Wed, 28 Jan 2026
 07:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Jan 2026 20:38:49 +0530
X-Gm-Features: AZwV_Qh8I6bUk6UmnyFbVlzL4EfGOlNYkPHELnidmBp1u2PFu_cRJl5OIdn6_MM
Message-ID: <CAAhSdy3DEXBniBDqyRpPxidB8gO6L_8bHMbJotX16eXyD0mYgg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Skip IMSIC update if vCPU IMSIC state is not initialized
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_150903_263922_4ACB00F2 
X-CRM114-Status: GOOD (  19.11  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMjoxM+KAr1BNIEppYWthaSBYdSA8amlha2FpcGVhbnV0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfdXBkYXRlKCkg
YXNzdW1lcyB0aGF0IHRoZSB2Q1BVIElNU0lDIHN0YXRlIGhhcwo+IGFscmVhZHkgYmVlbiBpbml0
aWFsaXplZCBhbmQgdW5jb25kaXRpb25hbGx5IGFjY2Vzc2VzIGltc2ljLT52c2ZpbGVfbG9jay4K
PiBIb3dldmVyLCBpbiBmdXp6ZWQgaW9jdGwgc2VxdWVuY2VzLCB0aGUgQUlBIGRldmljZSBtYXkg
YmUgaW5pdGlhbGl6ZWQgYXQKPiB0aGUgVk0gbGV2ZWwgd2hpbGUgdGhlIHBlci12Q1BVIElNU0lD
IHN0YXRlIGlzIHN0aWxsIE5VTEwuCj4KPiBUaGlzIGxlYWRzIHRvIGludmFsaWQgYWNjZXNzIHdo
ZW4gZW50ZXJpbmcgdGhlIHZDUFUgcnVuIGxvb3AgYmVmb3JlCj4gSU1TSUMgaW5pdGlhbGl6YXRp
b24gaGFzIGNvbXBsZXRlZC4KPgo+IFRoZSBjcmFzaCBtYW5pZmVzdHMgYXM6Cj4gICBVbmFibGUg
dG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MKPiAgIGRm
ZmZmZmZmMDAwMDAwMDYKPiAgIC4uLgo+ICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0
ZSBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo4MDEKPiAgIGt2bV9yaXNjdl92Y3B1X2FpYV91
cGRhdGUgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jOjQ5Mwo+ICAga3ZtX2FyY2hfdmNwdV9p
b2N0bF9ydW4gYXJjaC9yaXNjdi9rdm0vdmNwdS5jOjkyNwo+ICAgLi4uCj4KPiBBZGQgYSBndWFy
ZCB0byBza2lwIHRoZSBJTVNJQyB1cGRhdGUgcGF0aCB3aGVuIGltc2ljX3N0YXRlIGlzIE5VTEwu
IFRoaXMKPiBhbGxvd3MgdGhlIHZDUFUgcnVuIGxvb3AgdG8gY29udGludWUgc2FmZWx5Lgo+Cj4g
VGhpcyBpc3N1ZSB3YXMgZGlzY292ZXJlZCBkdXJpbmcgZnV6emluZyBvZiBSSVNDLVYgS1ZNIGNv
ZGUuCj4KPiBGaXhlczogZGI4YjdlOTdkNjEzN2EgKCJSSVNDLVY6IEtWTTogQWRkIGluLWtlcm5l
bCB2aXJ0dWFsaXphdGlvbiBvZiBBSUEgSU1TSUMiKQo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBY
dSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8
amlha2FpUGVhbnV0QGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjIwCgpU
aGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyB8IDQgKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IGlu
ZGV4IGU1OTdlODY0OTFjM2IuLmE3ZDM4N2UyODBkNDkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBA
IC03OTcsNiArNzk3LDEwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfdXBkYXRlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIGlmIChrdm0tPmFyY2guYWlhLm1vZGUgPT0g
S1ZNX0RFVl9SSVNDVl9BSUFfTU9ERV9FTVVMKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMTsK
Pgo+ICsgICAgICAgLyogSU1TSUMgdkNQVSBzdGF0ZSBtYXkgbm90IGJlIGluaXRpYWxpemVkIHll
dCAqLwo+ICsgICAgICAgaWYgKCFpbXNpYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4g
Kwo+ICAgICAgICAgLyogUmVhZCBvbGQgSU1TSUMgVlMtZmlsZSBkZXRhaWxzICovCj4gICAgICAg
ICByZWFkX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gICAgICAg
ICBvbGRfdnNmaWxlX2hnZWkgPSBpbXNpYy0+dnNmaWxlX2hnZWk7Cj4gLS0KPiAyLjM0LjEKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
