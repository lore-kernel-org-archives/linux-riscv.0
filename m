Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A1606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4BTWYrt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Wtzw1xME
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8IU6u7zjcax5eHMibQC0TofhSHAgc3rrieUTAjPWId4=; b=P4BTWYrtwsyt3/SDxV7sYG0WjE
	HGKFFaEjgFiqCvPPG8VoSb7lvh5n2MPRtoWgTm4fZKT8giCsFyw84CU+oO85arOhE064RilNFM4RB
	fW0rRJZJp+91FCvFQsj0e3c9pcZ40Kdgq0iJGOPyYBWQRLDaU8SJRjzcDXA3ORy7/rfTXdzu5plT8
	xb1WVEqni4ylg5mmfLsaKxO0XUmnaYk1uM6ETLmphxeDffzYWo22AxHSlvCHdH/+odMCbGTllRjUv
	WmKyPG3+gV0Mo72BILR8VJxfQhvXhTaLq182OirshwIMBO00csecG5ph5ZuhcoyhUTEbBFkAY02XE
	g1jjE3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpVI-0000000CXpL-1XGS;
	Fri, 13 Nov 2026 11:31:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpVB-0000000CXoE-1JT4
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 11:31:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so11873125e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 03:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569487; cv=none;
        d=google.com; s=arc-20260327;
        b=DDmsFMCOKWwwDwJOp1k1Ux3IejJiZaoIbzYZIepCOoVPBl1xH8Ow4slSVp5se1WKsk
         c9Ec/IxMOo4Zs5DMgQsChG2Rr1KO/euuBSrOl6nlWw5j2eENy2plgQfqCgD81ep99X73
         d113+sNlWqTZuIugwWUV9JufV4lJDALyqOrQiUHAvX46mCbuE760pcyE0q6uWjxyhT+J
         e08mJ+kBVlsFxskYu59jCF4I+QNt6FX5wQ1kc+TJ3egW6p2o+A5e0l5bIc6HN8168OiX
         GmzDvUgEsrl891tmabKO+Rpvf5QZVhlBEpgXvh4no823NfJ+rJIPUUb1LWreg2IJZ8wz
         wrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        fh=F1GIHshcFLL49Dyb9toLc/Nuv1n24OguTMcH3zlWoLs=;
        b=ciEVSFovdSkAVfnVsPVfPi29R3nLXlHvWbJJtiPtDBAqrdtEHHVTmTAIY42NKPM/wi
         pNRrGPWriIV2Y1xnssXB+m0fsYunFY1ZLHtNE+1nzSxjyu7rv6ZYqJVbpqQTy0XQBN7c
         Tqu04OSi4V+YRdf/mcfaKeeqkwHjYOTp2RPGPJFVfwt64cmmmnyee6ezMkfPkgsKWABc
         i7IqPFSiO7C3NCrNlpGOcNFx0FQvYFTtvbINrevGgy/lq2f4tZ8A+dsSgjauFikJc9Oc
         /QOTbS1YL5U0yX5Vg33OmAUuqXMI4YrvR3N99/IIbsZ8+nb/YfHH64zwJG+VY8NirV/i
         L2WA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794569487; x=1795174287; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        b=Wtzw1xMEHRvoZqRmdg3x8JOrps/WLj4grOTK9YvN62hNwmRldRHAKhF1blrJczcfXk
         nl3HhVM/KrOWK6JLFws3dpgyavLc/JclnQWSiKFb8/rjkBKXJCLt4Qn26yq8DHF+th18
         tHHZVFFTM4ReyCZAP12uQ5nlOqsLehYnc5mSbp+AirWS8kUqwogDuEdpeUON9vIFFsMR
         dP6m2QO3gnsckhjuxCkDn1XTAMuaOttRqamJQD28ohdQiBp6VIVxCloQWYEHZsW4nJJI
         fRFkYwaFQDnBNzkOwocpR8w9ojEtT+BAjAjMsg30BYxhqMxCogS2pJ3f626ZhnNosiGQ
         KXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569487; x=1795174287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        b=uiSKHet5KORaEozDXpN8JZlyyPoDOlYUkdDpVALdUQKHIZQ4cc6GSejyTQoDcqA7ke
         mYAoLnQpIk/SKHDvBU16bJdPsWdLKbp55FxcNL+SKkGO9bgaUieaGmpGaZhYjCwMwm38
         2LeSFcAJjc6fCRIBBtbrRp3iOxYF3JvyNU0pWLSv6omigFDAH/roBa7bAx3iClkWZ5of
         SrLh7EjxSNtrH8DEZeXv/FTxjK+WNmbnzNW6S06CD8bQ19+xwXc21c3575v0XjDM0Dj1
         xJ5v58F4qBdAO2YJY5Ipb1dOnqiZuJJf5FGDz7aiDN8QRL3X+pdbYF18QYqo1j0wqiVR
         7N8w==
X-Forwarded-Encrypted: i=1; AL+hErGKZ1WPSVdtbmHSIqsCNongn5F4dCgyk0lmSUsm3grIx+N457zC8VK5W39QZMnaeZtmw8UfGQrp1o72IA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9qb3M3xuLrtSuslf1/VHAkgP2OmdqxtG2yCAnUyhYq42r83sbQ
	XiXuV31RxK3IlIiUc84MKofmLyFMgGln95GLeXMhj4Q/LpOKbVvPZSh+Nx6m5Oe72hbQtG43PGo
	eQiRDxeqffmpjAUs1ZXgIULrZ9oYrhCw31I2wViEm0w==
X-Gm-Gg: AYBFou37BOgobz5iYI1/PojbnJuo4xBB9rEqWUIpUTz9H6jj6YXrjx2c3FMkjgtiYI2
	zbahI9RR0sNMB34HjzilQAGdfE6cllfbRtOa6anqWVB5+kz6tPS/gMU8aZMUhC7+aXPGq+WZ4k2
	YNIBNlTYktYUmCK7A0lDm71Act3oZ+0W4pCZIr+f+oHnNXTl2c9C5s5J4zs44om+BdndFXu0lb8
	QbpGUdKgjAbqsxHAIeAF2VOTwnr5T8sYp+2RdnN6qrvanbta65HuMY4usHDLQhckBpSg51J4P7z
	jDaYaQuQJJg5g8qEYmJhfaU30/EFXZCyK9sw2+ZYpW5PZ82TGbTrr2J+gq3GGCGJwgN5lKIVfMa
	KV6kLvD51KANC84DCCEZg7oCuZCXdZxfjGa+69EZpAxr03ZoDVzepvSk8xzlZgkfU05xJnJWUWW
	pqYJ/IyfxUFi6yAAIjLFb009YnkqlwV6+AsmWqb9aM0WBhahjlNKndoOQ=
X-Received: by 2002:a05:600c:8b55:b0:4a2:a3b:7aa8 with SMTP id
 5b1f17b1804b1-4bb55a02927mr44985235e9.3.1794569486922; Fri, 13 Nov 2026
 03:31:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016101458.221648-1-suunj1331@gmail.com>
In-Reply-To: <20261016101458.221648-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:01:15 +0530
X-Gm-Features: AclHuK90R6Cy2P8s5V5asYEwdHQCx6nGX6JWvDYYKndKeaNm5EjrRpe8coA3QcE
Message-ID: <CAAhSdy2KUD5xXFeKY0OD=iUzQzRHW87KjCamPQxcdxK-riq9FA@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Set Accessed bit in dirty-log write fault
 fast path
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: atish.patra@linux.dev, tjytimi@163.com, inochiama@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	andrew.jones@linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_033131_425717_867E51EB 
X-CRM114-Status: GOOD (  21.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMTYsIDIwMjYgYXQgMzo0NeKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4ga3ZtX3Jpc2N2X21tdV9kaXJ0eV9sb2dfd3JpdGVfZmF1
bHRfZmFzdCgpIGNvbnNpZGVycyBhIGxlYWYgd2l0aCBXCj4gYW5kIEQgc2V0IGFscmVhZHkgaGFu
ZGxlZCwgZXZlbiBpZiBhZ2luZyBoYXMgY2xlYXJlZCBpdHMgQSBiaXQuCj4gT24gaGFyZHdhcmUg
dGhhdCBmYXVsdHMgd2hlbiBBIGlzIGNsZWFyLCB0aGUgZmFzdCBwYXRoIHJldHVybnMKPiB0cnVl
IHdpdGhvdXQgc2V0dGluZyBBIGFuZCBza2lwcyB0aGUgc2xvdyBwYXRoIHRoYXQgd291bGQgc2V0
IGl0Lgo+IFRoZSBndWVzdCByZXRyaWVzIHRoZSBzYW1lIHN0b3JlLCBidXQgQSBpcyBzdGlsbCBj
bGVhciwgc28gaXQKPiBmYXVsdHMgYWdhaW4uIFRoaXMgcmVwZWF0cyBpbmRlZmluaXRlbHksIHBy
ZXZlbnRpbmcgdGhlIGd1ZXN0Cj4gZnJvbSBtYWtpbmcgcHJvZ3Jlc3MuCj4KPiBIb3N0IHJlY2xh
aW0gb3IgcGFnZV9pZGxlIGNhbiB0cmlnZ2VyIHRoaXMgd2hpbGUgZGlydHkgbG9nZ2luZyBpcwo+
IGVuYWJsZWQsIHBvdGVudGlhbGx5IGhhbmdpbmcgdkNQVXMgZHVyaW5nIGxpdmUgbWlncmF0aW9u
Lgo+Cj4gUmVxdWlyZSBfUEFHRV9BQ0NFU1NFRCBpbiBhZGRpdGlvbiB0byBXIGFuZCBEIGJlZm9y
ZSB0cmVhdGluZyB0aGUKPiBmYXVsdCBhcyBoYW5kbGVkLCBhbmQgc2V0IEEgYWxvbmcgd2l0aCBX
IGFuZCBELiBUaGUgZXhpc3RpbmcKPiBjbXB4Y2hnIGxvb3AgcmV0cmllcyBpZiBhZ2luZyBjaGFu
Z2VzIHRoZSBQVEUgYmVmb3JlIHRoZSB1cGRhdGUuCj4KPiBGaXhlczogNzcwNWJlNTllYjJkICgi
S1ZNOiByaXNjdjogRmFzdC1wYXRoIGRpcnR5IGxvZ2dpbmcgd3JpdGUgZmF1bHRzIikKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDcuMisKPiBTaWduZWQtb2ZmLWJ5OiBTZXVuZ0p1IENo
ZW9uIDxzdXVuajEzMzFAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExp
bnV4LTcuNC1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiBUZXN0aW5nOgo+Cj4gT24gYSBIaUZp
dmUgUHJlbWllciBQNTUwIChFSUM3NzAwWCwgd2hpY2ggdHJhcHMgb24gY2xlYXIgQS9EIGJpdHMp
LAo+IHJ1bjoKPgo+IGRpcnR5X2xvZ19wZXJmX3Rlc3QgLXYgMyAtYiAyNTZNIC1pIDMKPgo+IFdo
aWxlIHRoZSB0ZXN0IHJ1bnMsIHJlcGVhdGVkbHkgbWFyayBhbGwgc3lzdGVtIFJBTSBpZGxlIHRo
cm91Z2gKPiAvc3lzL2tlcm5lbC9tbS9wYWdlX2lkbGUvYml0bWFwLgo+Cj4gQmVmb3JlIHRoZSBm
aXgsIHRoZSB0ZXN0IGRpZCBub3QgY29tcGxldGUgaXRzIGZpcnN0IGl0ZXJhdGlvbiBpbgo+IG92
ZXIgMTEgbWludXRlcywgd2l0aCBsb2NrX3N0YXQgc2hvd2luZyBhYm91dCAxNmsgcmVhZC1zaWRl
Cj4gbW11X2xvY2sgYWNxdWlzaXRpb25zIHBlciBzZWNvbmQgZnJvbSB0aGUgZmFzdCBwYXRoLgo+
Cj4gQWZ0ZXIgdGhlIGZpeCwgYWxsIHRocmVlIGl0ZXJhdGlvbnMgY29tcGxldGUsIGVhY2ggdGFr
aW5nIGFib3V0Cj4gMjkgc2Vjb25kcyB1bmRlciB0aGUgc2FtZSBhZ2luZyB3b3JrbG9hZC4KPgo+
ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCA3OGExODI2YzQ2NmQuLjA0
MmQxZTNiMzU0NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTU5MSwxNCArNTkxLDE1IEBAIHN0YXRpYyBib29sIGt2
bV9yaXNjdl9tbXVfZGlydHlfbG9nX3dyaXRlX2ZhdWx0X2Zhc3Qoc3RydWN0IGt2bSAqa3ZtLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGRpcnR5X21hcmtlZCA9IHRydWU7Cj4gICAgICAgICAg
ICAgICAgIH0KPgo+IC0gICAgICAgICAgICAgICBpZiAoKHB0ZV92YWwob2xkX3B0ZSkgJiAoX1BB
R0VfV1JJVEUgfCBfUEFHRV9ESVJUWSkpID09Cj4gLSAgICAgICAgICAgICAgICAgICAoX1BBR0Vf
V1JJVEUgfCBfUEFHRV9ESVJUWSkpIHsKPiArICAgICAgICAgICAgICAgaWYgKChwdGVfdmFsKG9s
ZF9wdGUpICYKPiArICAgICAgICAgICAgICAgICAgICAoX1BBR0VfV1JJVEUgfCBfUEFHRV9ESVJU
WSB8IF9QQUdFX0FDQ0VTU0VEKSkgPT0KPiArICAgICAgICAgICAgICAgICAgIChfUEFHRV9XUklU
RSB8IF9QQUdFX0RJUlRZIHwgX1BBR0VfQUNDRVNTRUQpKSB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgbmV3X3B0ZSA9IG9sZF9wdGU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
dHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAg
fQo+Cj4gLSAgICAgICAgICAgICAgIG5ld19wdGUgPSBwdGVfbWtkaXJ0eShwdGVfbWt3cml0ZV9u
b3ZtYShvbGRfcHRlKSk7Cj4gKyAgICAgICAgICAgICAgIG5ld19wdGUgPSBwdGVfbWt5b3VuZyhw
dGVfbWtkaXJ0eShwdGVfbWt3cml0ZV9ub3ZtYShvbGRfcHRlKSkpOwo+Cj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fcmlzY3ZfZ3N0YWdlX3RyeV91cGRhdGVfcHRlKCZnc3RhZ2UsIHB0ZXBfbGV2
ZWwsIGdwYSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHRlcCwgb2xkX3B0ZSwgbmV3X3B0ZSkpIHsKPiAtLQo+IDIuNTIuMAo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
