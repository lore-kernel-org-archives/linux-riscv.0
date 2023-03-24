Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B8C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oV93MlUzmHCm+pJWHnScg0K0jhENu3fPB0pFsizPU3s=; b=RESICB6GYLSPSH
	pQq1azx2RbgA7vgWeuuoSJZh8v6aKvyJAsWalVKdnTihv19jlVJwgPoW3Dj8jUGo0bi+KoXOn+yni
	D/+iRV4RVKk6vqhv5RiFCEqMNctCz1ughDfSVK2voaFnycga0CUpbJuQ3zJET2qebN6buvOVXxzqF
	6Nv9UjnwK28ZXpcj3FPu0lpe9mjlhq0Z9foB0FWn+dfMcij9IN4kwISAilWTKmR5LqlFOe8zfGvBk
	0qkrO0E+7TFCARW2/uz1Olk9kNHau2ptUQMXN6Q4HnV2LbOV+r4nLMp6TqSUhSXwGgu7loymNahGd
	UR9D01eauMYMR1stpIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgTK-004Lbd-09;
	Fri, 24 Mar 2023 12:24:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgTH-004Lal-2S
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 12:24:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o12so7239534edb.9
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1679660678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saiJWfiBJYUHFmmkpXKqAcWXgG16rIcjFJWmsrkcUI8=;
        b=EtKrFAIJqJ7YZIEm/FMGhq05IjhpUe6/Li67kSto0rxiCIL9ChSECmKLpZP8MICvTJ
         A4LHKUIBYl66xKKWghQbVhEdqlDgGPZEYd2HSUiblT6Vo1VXHrFQlUEOFe1OebHWzo7w
         rwO+LIZs1KftyqlJM2mcOpIUhnH/IyoXSWnuzw2kjpysVG6cQVYfE1q+fMorBZbWDwGd
         fADvXukNqjPLIZRBWs5TTZjekakGChj4gh1AUE06DWDCuGHFuJfzs+XJWGfh/Q282xjG
         p9zUmlLcgePiwXKo0ntqmBcx/pqwztc0KqarUUddIvb+7ACbF6J6uPnKdbi/ZQOTWWgG
         Snig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679660678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saiJWfiBJYUHFmmkpXKqAcWXgG16rIcjFJWmsrkcUI8=;
        b=n/mqk1+8EPyDTZAts+fgySPM30I/45CxyjggzR0NPzIrhGIUdlT4BPwDHsoiWI/B7L
         1AHTPK45prHEQ5G8xLHgiFZni+beNExfcu7qp+u063j1mTeqpAbJyP4R9FrQIdAqKe/m
         SjwGIkHQYzN6+yhA5WONaww6zBv2oKVdILIphMQmmha1qzN7v9AEIZQABU+4xXD1sluk
         xWh5gFUqm2UKrd4zDVJK6A1iYe8tTMt6/6KYDNUkhkc+HG+Fn+yFyOC+b+foF+tYLGCr
         Efvsn+fuKUCoXT2wwnZIQHN2riY+rFhVLOx+QcyqS5b9vc/frmwApvQ2MPmdMVa9dXK/
         wj5w==
X-Gm-Message-State: AO0yUKVy3bMD5I0LYlkUlv/dKxxKyDKUlGDbediJBTq4uZ6YaGyO39GR
	tMdWPXWa3agEKRx/D22lmdTPHkQQW4KNI1f8dWo9yw==
X-Google-Smtp-Source: AK7set9rky6P4VsXrUmz7PYgIM7cL0IKBL36K0jYa02+JzZXAjW8VAmeF9bBNJsOXuA+Z8/lRmfSNoLeRN5Gl/Db24Q=
X-Received: by 2002:a17:907:11c6:b0:930:310:abe3 with SMTP id
 va6-20020a17090711c600b009300310abe3mr5178745ejb.6.1679660678163; Fri, 24 Mar
 2023 05:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230317211106.1234484-1-dmatlack@google.com>
In-Reply-To: <20230317211106.1234484-1-dmatlack@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Mar 2023 17:54:27 +0530
Message-ID: <CAAhSdy3RJvsCTTfr6mCJe+=on-B0QOM10dTchAR7rKq0tyVWEA@mail.gmail.com>
Subject: Re: [PATCH] KVM: RISC-V: Retry fault if vma_lookup() results become invalid
To: David Matlack <dmatlack@google.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_052439_803635_FB26176E 
X-CRM114-Status: GOOD (  24.14  )
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

T24gU2F0LCBNYXIgMTgsIDIwMjMgYXQgMjo0MeKAr0FNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gUmVhZCBtbXVfaW52YWxpZGF0ZV9zZXEgYmVmb3JlIGRy
b3BwaW5nIHRoZSBtbWFwX2xvY2sgc28gdGhhdCBLVk0gY2FuCj4gZGV0ZWN0IGlmIHRoZSByZXN1
bHRzIG9mIHZtYV9sb29rdXAoKSAoZS5nLiB2bWFfc2hpZnQpIGJlY29tZSBzdGFsZQo+IGJlZm9y
ZSBpdCBhY3F1aXJlcyBrdm0tPm1tdV9sb2NrLiBUaGlzIGZpeGVzIGEgdGhlb3JldGljYWwgYnVn
IHdoZXJlIGEKPiBWTUEgY291bGQgYmUgY2hhbmdlZCBieSB1c2Vyc3BhY2UgYWZ0ZXIgdm1hX2xv
b2t1cCgpIGFuZCBiZWZvcmUgS1ZNCj4gcmVhZHMgdGhlIG1tdV9pbnZhbGlkYXRlX3NlcSwgY2F1
c2luZyBLVk0gdG8gaW5zdGFsbCBwYWdlIHRhYmxlIGVudHJpZXMKPiBiYXNlZCBvbiBhIChwb3Nz
aWJseSkgbm8tbG9uZ2VyLXZhbGlkIHZtYV9zaGlmdC4KPgo+IFJlLW9yZGVyIHRoZSBNTVUgY2Fj
aGUgdG9wLXVwIHRvIGVhcmxpZXIgaW4gdXNlcl9tZW1fYWJvcnQoKSBzbyB0aGF0IGl0Cj4gaXMg
bm90IGRvbmUgYWZ0ZXIgS1ZNIGhhcyByZWFkIG1tdV9pbnZhbGlkYXRlX3NlcSAoaS5lLiBzbyBh
cyB0byBhdm9pZAo+IGluZHVjaW5nIHNwdXJpb3VzIGZhdWx0IHJldHJpZXMpLgo+Cj4gSXQncyB1
bmxpa2VseSB0aGF0IGFueSBzYW5lIHVzZXJzcGFjZSBjdXJyZW50bHkgbW9kaWZpZXMgVk1BcyBp
biBzdWNoIGEKPiB3YXkgYXMgdG8gdHJpZ2dlciB0aGlzIHJhY2UuIEFuZCBldmVuIHdpdGggZGly
ZWN0ZWQgdGVzdGluZyBJIHdhcyB1bmFibGUKPiB0byByZXByb2R1Y2UgaXQuIEJ1dCBhIHN1ZmZp
Y2llbnRseSBtb3RpdmF0ZWQgaG9zdCB1c2Vyc3BhY2UgbWlnaHQgYmUKPiBhYmxlIHRvIGV4cGxv
aXQgdGhpcyByYWNlLgo+Cj4gTm90ZSBLVk0vQVJNIGhhZCB0aGUgc2FtZSBidWcgYW5kIHdhcyBm
aXhlZCBpbiBhIHNlcGFyYXRlLCBuZWFyCj4gaWRlbnRpY2FsIHBhdGNoIChzZWUgTGluaykuCj4K
PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAyMzAzMTMyMzU0NTQuMjk2NDA2
Ny0xLWRtYXRsYWNrQGdvb2dsZS5jb20vCj4gRml4ZXM6IDk5NTUzNzFjYzAxNCAoIlJJU0MtVjog
S1ZNOiBJbXBsZW1lbnQgTU1VIG5vdGlmaWVycyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgoK
SSBoYXZlIHRlc3RlZCB0aGlzIHBhdGNoIGZvciBib3RoIFFFTVUgUlY2NCBhbmQgUlYzMiBzbywK
VGVzdGVkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMg
cGF0Y2ggYXMgZml4ZXMgZm9yIExpbnV4LTYuMwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IE5vdGU6
IENvbXBpbGUtdGVzdGVkIG9ubHkuCj4KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCAyNSArKysr
KysrKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIv
YXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCA3ODIxMWFlZDM2ZmEuLjQ2ZDY5Mjk5NTgzMCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L21tdS5jCj4gQEAgLTYyOCw2ICs2MjgsMTMgQEAgaW50IGt2bV9yaXNjdl9nc3RhZ2VfbWFwKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAhKG1lbXNsb3Qt
PmZsYWdzICYgS1ZNX01FTV9SRUFET05MWSkpID8gdHJ1ZSA6IGZhbHNlOwo+ICAgICAgICAgdW5z
aWduZWQgbG9uZyB2bWFfcGFnZXNpemUsIG1tdV9zZXE7Cj4KPiArICAgICAgIC8qIFdlIG5lZWQg
bWluaW11bSBzZWNvbmQrdGhpcmQgbGV2ZWwgcGFnZXMgKi8KPiArICAgICAgIHJldCA9IGt2bV9t
bXVfdG9wdXBfbWVtb3J5X2NhY2hlKHBjYWNoZSwgZ3N0YWdlX3BnZF9sZXZlbHMpOwo+ICsgICAg
ICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBrdm1fZXJyKCJGYWlsZWQgdG8gdG9wdXAg
Ry1zdGFnZSBjYWNoZVxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAg
ICB9Cj4gKwo+ICAgICAgICAgbW1hcF9yZWFkX2xvY2soY3VycmVudC0+bW0pOwo+Cj4gICAgICAg
ICB2bWEgPSB2bWFfbG9va3VwKGN1cnJlbnQtPm1tLCBodmEpOwo+IEBAIC02NDgsNiArNjU1LDE1
IEBAIGludCBrdm1fcmlzY3ZfZ3N0YWdlX21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAg
ICAgICBpZiAodm1hX3BhZ2VzaXplID09IFBNRF9TSVpFIHx8IHZtYV9wYWdlc2l6ZSA9PSBQVURf
U0laRSkKPiAgICAgICAgICAgICAgICAgZ2ZuID0gKGdwYSAmIGh1Z2VfcGFnZV9tYXNrKGhzdGF0
ZV92bWEodm1hKSkpID4+IFBBR0VfU0hJRlQ7Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBS
ZWFkIG1tdV9pbnZhbGlkYXRlX3NlcSBzbyB0aGF0IEtWTSBjYW4gZGV0ZWN0IGlmIHRoZSByZXN1
bHRzIG9mCj4gKyAgICAgICAgKiB2bWFfbG9va3VwKCkgb3IgZ2ZuX3RvX3Bmbl9wcm90KCkgYmVj
b21lIHN0YWxlIHByaW9ydCB0byBhY3F1aXJpbmcKPiArICAgICAgICAqIGt2bS0+bW11X2xvY2su
Cj4gKyAgICAgICAgKgo+ICsgICAgICAgICogUmVseSBvbiBtbWFwX3JlYWRfdW5sb2NrKCkgZm9y
IGFuIGltcGxpY2l0IHNtcF9ybWIoKSwgd2hpY2ggcGFpcnMKPiArICAgICAgICAqIHdpdGggdGhl
IHNtcF93bWIoKSBpbiBrdm1fbW11X2ludmFsaWRhdGVfZW5kKCkuCj4gKyAgICAgICAgKi8KPiAr
ICAgICAgIG1tdV9zZXEgPSBrdm0tPm1tdV9pbnZhbGlkYXRlX3NlcTsKPiAgICAgICAgIG1tYXBf
cmVhZF91bmxvY2soY3VycmVudC0+bW0pOwo+Cj4gICAgICAgICBpZiAodm1hX3BhZ2VzaXplICE9
IFBVRF9TSVpFICYmCj4gQEAgLTY1NywxNSArNjczLDYgQEAgaW50IGt2bV9yaXNjdl9nc3RhZ2Vf
bWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFV
TFQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIC8qIFdlIG5lZWQgbWluaW11bSBzZWNvbmQrdGhp
cmQgbGV2ZWwgcGFnZXMgKi8KPiAtICAgICAgIHJldCA9IGt2bV9tbXVfdG9wdXBfbWVtb3J5X2Nh
Y2hlKHBjYWNoZSwgZ3N0YWdlX3BnZF9sZXZlbHMpOwo+IC0gICAgICAgaWYgKHJldCkgewo+IC0g
ICAgICAgICAgICAgICBrdm1fZXJyKCJGYWlsZWQgdG8gdG9wdXAgRy1zdGFnZSBjYWNoZVxuIik7
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAg
bW11X3NlcSA9IGt2bS0+bW11X2ludmFsaWRhdGVfc2VxOwo+IC0KPiAgICAgICAgIGhmbiA9IGdm
bl90b19wZm5fcHJvdChrdm0sIGdmbiwgaXNfd3JpdGUsICZ3cml0YWJsZSk7Cj4gICAgICAgICBp
ZiAoaGZuID09IEtWTV9QRk5fRVJSX0hXUE9JU09OKSB7Cj4gICAgICAgICAgICAgICAgIHNlbmRf
c2lnX21jZWVycihCVVNfTUNFRVJSX0FSLCAodm9pZCBfX3VzZXIgKilodmEsCj4KPiBiYXNlLWNv
bW1pdDogZWVhYzhlZGUxNzU1NzY4MDg1NTAzMWM2ZjMwNWVjZTIzNzhhZjMyNgo+IC0tCj4gMi40
MC4wLnJjMi4zMzIuZ2E0NjQ0MzQ4MGMtZ29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
