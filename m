Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54667E784BE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbDZLh3mCsRoKROxn1EcVKSWLudYOTcixJe0VilXeOU=; b=zYYmdMTvqD1j0V
	u/zQPcWTJc9m2PSHgZlQqBH4FGEDu8Rg3T0HX6Mt57ABAn2dXc2SWca3RjhCf1+c/sQolt4Nxjvac
	qdQMoIV5TsTKKZwHMJ7FV56bS86jNbuqn/uzpCrHAN0gNGCmTVZUKKZc1OyB8naX3MY2GcI9neZ33
	7fh1pM9r913bd1mFqh5OIAoPFbT1YDHjeAu8gK465055/Oy/okRwmi5SE/BiUqV45mAXc8d69B1Al
	Lm0m5oVCoaST7WUiA954aDZOLFsdUuW+foQ1c8oFdOF/V7IQOsexmXgU5+QFww9p6iWdWI4kmu5HR
	h8MvqIYCLpMM+Aq6GLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKv7-00CzbL-1a;
	Mon, 02 Oct 2023 15:33:17 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKv4-00CzaM-1S
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:33:15 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bffc55af02so253242781fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696260789; x=1696865589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AurjURdP5ZlZL/smukAb81hKmuzUvXiFYPJa040s804=;
        b=f8TFU/vCIZfiBPCGMNJe6sAE+hceMz8OyY5dMyS7yvDa6EjXkiEfyMjL3pJX9QCns3
         3np65xPfA5MZLZKGdocrEcKRQNlk4Q0+1J6kiFEkKJL8t6KmPHY66IdQcDNiuT2Ckjo5
         JJCBkgxARYDN+96IZAxhEtHxFh7uunPgtv+NWk7jmyJFyTZbK1hHSte3jjVPQ3GUokt3
         jKWGKxMuN0ust2h2/1SKI/oX66jgEud+5MkkzQDnX73KgRVtShLMB5uHMuAYgSasMUC3
         mo4Y8ZjjP+/I7y3GYFItCio/Ft1se1v4ov+Adx8PmqlGnPmv6OZkcSQqG7MaHUK6kOnE
         eJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696260789; x=1696865589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AurjURdP5ZlZL/smukAb81hKmuzUvXiFYPJa040s804=;
        b=MEk0lTAB3iHWvGGIUn5pJKxbJDCPMqHlL2GzJsXw5SxP2L4EBYx6NgEs/ey2dhZ/6L
         e+eQ1a2Ot9rwg4p0duQygKmd7omM7Ksb8PGwGv+Hja8LOFk+UamfPrGgM52eHLdDAgDS
         8MHyCkS7FVdNxvnYo+CShS0rH0tguWasG6E6rVakkWJbSsaF/dSApgtlPdHO3qfThfwh
         uJ5lKB3e3JZk1mqsGeA5rkQNY1nuRPNfo4DTiJT/f/ImEXW0TigcboUUOoj72wuc6jCA
         QHN0DBMPwb2p2JkV85Y/cqEBhkd7QRcC1thaWzC2Y6C8hUPQZeuZH7USWJ2f3Ptl5Eyw
         JwUw==
X-Gm-Message-State: AOJu0YwNOV8HCughxW3Dswio4/foAYd25eOo1LPY+sQpwZeRQp13+Fyy
	TCYirFC70ArLzPOL8pzMQus9Dcr3VH8su94i3Oo=
X-Google-Smtp-Source: AGHT+IHKX5/Cmt0I3N4/+jkaTuwYAcYj6gJd3d7Qv8r9/mddP7OXp8vB7NnHRV+OkFIzu4dN86GLaB4Qkm2lucLPAm8=
X-Received: by 2002:a2e:8448:0:b0:2bc:f39b:d1a8 with SMTP id
 u8-20020a2e8448000000b002bcf39bd1a8mr9237063ljh.46.1696260788411; Mon, 02 Oct
 2023 08:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230926150316.1129648-1-cleger@rivosinc.com> <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com> <20231002-spearman-doze-70cc026ac13e@spud>
 <693e6584-1e66-48c0-aa7c-61d9f88abd4c@rivosinc.com>
In-Reply-To: <693e6584-1e66-48c0-aa7c-61d9f88abd4c@rivosinc.com>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 2 Oct 2023 09:32:56 -0600
Message-ID: <CAP6exYLtQuyqMgG6jRAhizp-52ebu3OLNSXe8a8xvLALYFD3kA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Evan Green <evan@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Daniel Maslowski <cyrevolt@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_083314_493035_87F8322A 
X-CRM114-Status: GOOD (  27.24  )
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

VGhpcyB3YXMgYSB2ZXJ5IGludGVyZXN0aW5nIHJlYWQuIE9uZSBvdGhlciB0aG91Z2h0IGNyb3Nz
ZWQgbXkgbWluZCwKd2hpY2ggaXMgdGhhdCBhIFJJU0MtViBpbXBsZW1lbnRhdGlvbiBtaWdodCBt
YWtlIHRoZSBhbGlnbm1lbnQKZGVsZWdhdGlvbiBoYXJkLXdpcmVkIHRvIGFsd2F5cyBkZWxlZ2F0
ZSB0byBTIG1vZGUuIEkuZSwgdGhlIGJpdCBtaWdodApiZSBXQVJMIGFuZCBhbHdheXMgMS4gRm9y
IHdoYXQgSSdtIGRvaW5nLCB0aGlzIHdvdWxkIGFjdHVhbGx5IGJlCnByZXR0eSBjb252ZW5pZW50
LiBKdXN0IHdhbnQgdG8gbWFrZSBzdXJlIHRoaXMgY29kZSBjYW4gYWNjb21tb2RhdGUKdGhhdCAt
LSB3ZHl0PwoKV2UgaGF2ZSBmb3VuZCBsb3RzIG9mIHZhbHVlIGluIG91ciBleHBlcmltZW50cyB3
aXRoIGRlbGVnYXRpbmcKYWxpZ25tZW50IHRyYXBzIHRvIExpbnV4IC0tIG5vdCBsZWFzdCBiZWNh
dXNlIHRoZXkgdGVuZCB0byBsb2NhdGUKcHJvYmxlbXMgaW4gdGhlIGtlcm5lbCA6LSkgLS0gd2Un
dmUgZm91bmQgaXNzdWVzIGluIG1vZHVsZSBsb2FkaW5nLAplYXJseSBzdGFydHVwICh0aGVyZSdz
IGEgbmVlZGVkIC5hbGlnbjIgZGlyZWN0aXZlIGZvciBzYmkgc2Vjb25kYXJ5CnN0YXJ0dXAsIEFG
QUlDVCkgYW5kIHRoZSB0aW1pbmcgY29kZSBmb3IgbWlzYWxpZ25lZCBsb2FkL3N0b3JlCmhhbmRs
aW5nLgoKSSBkb24ndCBrbm93IGhvdyB5b3UgdGVzdCB0aGlzIHVuYWxpZ25lZCB0cmFwIGhhbmRs
aW5nLCBidXQgaXQgbWlnaHQKYmUgd29ydGh3aGlsZSB0byB3b3JrIHRoYXQgb3V0LiBZb3UgY2Fu
IHRlc3QgdmlhIG9yZWJvb3QgYW5kIHRoZQp2aXNpb25maXZlMiwgc2F2ZSB3ZSBoYXZlIG5vdCBm
aWd1cmVkIG91dCB3aHkgU01QIHN0YXJ0dXAgaXMgZ29pbmcKd3JvbmcsIHlldCA6LSksIHNvIHdl
J3JlIG5vdCBhcyBmZWF0dXJlLWNvbXBsZXRlIGFzIG5lZWRlZC4gQnV0IHNvb24uCgpUaGFua3Mh
CgpPbiBNb24sIE9jdCAyLCAyMDIzIGF0IDU6MTnigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDAyLzEwLzIwMjMgMTI6NDksIENvbm9y
IERvb2xleSB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDAyLCAyMDIzIGF0IDA5OjQwOjA0QU0gKzAy
MDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4gT24gMzAvMDkvMjAyMyAx
MToyMywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4+PiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCAw
NTowMzowOVBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPj4+PiBTaW5jZSBjb21t
aXQgNjFjYWRiOSAoIlByb3ZpZGUgbmV3IGRlc2NyaXB0aW9uIG9mIG1pc2FsaWduZWQgbG9hZC9z
dG9yZQo+ID4+Pj4gYmVoYXZpb3IgY29tcGF0aWJsZSB3aXRoIHByaXZpbGVnZWQgYXJjaGl0ZWN0
dXJlLiIpIGluIHRoZSBSSVNDLVYgSVNBCj4gPj4+PiBtYW51YWwsIGl0IGlzIHN0YXRlZCB0aGF0
IG1pc2FsaWduZWQgbG9hZC9zdG9yZSBtaWdodCBub3QgYmUgc3VwcG9ydGVkLgo+ID4+Pj4gSG93
ZXZlciwgdGhlIFJJU0MtViBrZXJuZWwgdUFCSSBkZXNjcmliZXMgdGhhdCBtaXNhbGlnbmVkIGFj
Y2Vzc2VzIGFyZQo+ID4+Pj4gc3VwcG9ydGVkLiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQsIHRo
aXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgUy1tb2RlCj4gPj4+PiBoYW5kbGluZyBvZiBtaXNh
bGlnbmVkIGFjY2Vzc2VzIGFzIHdlbGwgc3VwcG9ydCBmb3IgcHJjdGwoUFJfVU5BTElHTikuCj4g
Pj4+Pgo+ID4+Pj4gSGFuZGxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgaW4ga2VybmVsIGFsbG93cyBm
b3IgYSBmaW5lciBncmFpbiBjb250cm9sCj4gPj4+PiBvZiB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Nl
cyBiZWhhdmlvciwgYW5kIHRoYW5rcyB0byB0aGUgcHJjdGwgY2FsbCwgY2FuCj4gPj4+PiBhbGxv
dyBkaXNhYmxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgZW11bGF0aW9uIHRvIGdlbmVyYXRlIFNJR0JV
Uy4gVXNlcgo+ID4+Pj4gc3BhY2UgY2FuIHRoZW4gb3B0aW1pemUgaXRzIHNvZnR3YXJlIGJ5IHJl
bW92aW5nIHN1Y2ggYWNjZXNzIGJhc2VkIG9uCj4gPj4+PiBTSUdCVVMgZ2VuZXJhdGlvbi4KPiA+
Pj4+Cj4gPj4+PiBDdXJyZW50bHksIHRoaXMgc2VyaWVzIGlzIHVzZWZ1bCBmb3IgcGVvcGxlIHRo
YXQgdXNlcyBhIFNCSSB0aGF0IGRvZXMKPiA+Pj4+IG5vdCBoYW5kbGVkIG1pc2FsaWduZWQgdHJh
cHMuIEluIGEgbmVhciBmdXR1cmUsIHRoaXMgc2VyaWVzIHdpbGwgbWFrZQo+ID4+Pj4gdXNlIGEg
U0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVzdCBkZWxlZ2F0aW9uIG9mIHRoZQo+
ID4+Pj4gbWlzYWxpZ25lZCBsb2FkL3N0b3JlIHRyYXBzIHRvIHRoZSBTLW1vZGUgc29mdHdhcmUu
IFRoaXMgZXh0ZW5zaW9uIGhhcwo+ID4+Pj4gYmVlbiBzdWJtaXR0ZWQgZm9yIHJldmlldyB0byB0
aGUgcmlzY3YgdGVjaC1wcnMgZ3JvdXAuIEFuIE9wZW5TQkkKPiA+Pj4+IGltcGxlbWVudGF0aW9u
IGZvciB0aGlzIHNwZWMgaXMgYXZhaWxhYmxlIGF0IFsyXS4KPiA+Pj4+Cj4gPj4+PiBUaGlzIHNl
cmllcyBjYW4gYmUgdGVzdGVkIHVzaW5nIHRoZSBzcGlrZSBzaW11bGF0b3IgWzNdIGFuZCBhbiBv
cGVuU0JJCj4gPj4+PiB2ZXJzaW9uIFs0XSB3aGljaCBhbGxvd3MgdG8gYWx3YXlzIGRlbGVnYXRl
IG1pc2FsaWduZWQgbG9hZC9zdG9yZSB0bwo+ID4+Pj4gUy1tb2RlLgo+ID4+Pgo+ID4+PiBTb21l
IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgZG8gbm90IGJ1aWxkIGZvciBhbnkgY29uZmlncywgc29t
ZSBhcmUKPiA+Pj4gYnJva2VuIGZvciBjbGFuZyBidWlsZHMgYW5kIG90aGVycyBhcmUgYnJva2Vu
IGZvciBub21tdS4gUGxlYXNlIHRyeSB0bz4gYnVpbGQgdGVzdCB0aGlzIG1vcmUgdGhvcm91Z2hs
eSBiZWZvcmUgeW91IHN1Ym1pdCB0aGUgbmV4dCB2ZXJzaW9uLgo+ID4+Cj4gPj4gSGkgQ29ub3Is
Cj4gPj4KPiA+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgSSdsbCBjaGVjayB0aGF0Lgo+ID4+
Cj4gPj4+Cj4gPj4+IEFsc28sIEFJVUksIHRoaXMgc2VyaWVzIHNob3VsZCBiZSBtYXJrZWQgUkZD
IHNpbmNlIHRoZSBTQkkgZXh0ZW5zaW9uCj4gPj4+IHRoaXMgcmVsaWVzIG9uIGhhcyBub3QgYmVl
biBmcm96ZW4uCj4gPj4KPiA+PiBUaGlzIHNlcmllcyBkb2VzIG5vdCBhY3R1YWxseSB1c2VzIHRo
ZSBTQkkgZXh0ZW5zaW9uIGJ1dCBwcm92aWRlcyBhIHdheQo+ID4+IHRvIGRldGVjdCBpZiBtaXNh
bGlnbmVkIGFjY2Vzc2VzIGFyZSBub3QgaGFuZGxlZCBieSBoYXJkd2FyZSBub3IgYnkgdGhlCj4g
Pj4gU0JJLiBJdCBoYXMgYmVlbiByZXBvcnRlZCBieSBSb24gJiBEYW5pZWwgdGhleSB0aGV5IGhh
dmUgYSBtaW5pbWFsIFNCSQo+ID4+IGltcGxlbWVudGF0aW9uIHRoYXQgZG9lcyBub3QgaGFuZGxl
IG1pc2FsaWduZWQgYWNjZXNzZXMgYW5kIHRoYXQgdGhleQo+ID4+IHdvdWxkIGxpa2UgdG8gbWFr
ZSB1c2Ugb2YgdGhlIFBSX1NFVF9VTkFMSUdOIGZlYXR1cmUuIFRoaXMgaXMgd2hhdCB0aGlzCj4g
Pj4gc2VyaWVzIGFkZHJlc3NlcyAoYW5kIHRodXMgZG9lcyBub3QgZGVwZW5kIG9uIHRoZSBtZW50
aW9uZWQgU0JJIGV4dGVuc2lvbikuCj4gPgo+ID4gQWgsIEkgbXVzdCBoYXZlIG1pc3JlYWQgdGhl
bi4gQXBvbG9naWVzLgo+Cj4gTm8gd29ycmllcywgbWF5YmUgSSBzaG91bGQgYWN0dWFsbHkgcmVt
b3ZlIHRoaXMgZnJvbSB0aGUgY292ZXIgbGV0dGVyIHRvCj4gYXZvaWQgYW55IGNvbmZ1c2lvbiAh
Cj4KPiBDbMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
