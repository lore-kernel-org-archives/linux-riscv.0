Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82596FF8862
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OecRQQPA8r49EJj+SfqcimkIxEmmEBm/V8kGTxPH36A=; b=xI5mRT0qC9k/W1
	TlLnzS4S+yUidJBwByJ/L5ewMCXI/s4VY6kKLPeKQC72tiRBNtaa+NRRAi300iSRvbBqmqRJbKsgN
	Dwcb271mVB00u1iBW/dOL5X3EMkox1FyI91uSAP2hvGsUaI3CLgH7xZYgp3G97g1tQlfmBkB4cc+2
	1IsOtJOqQ6ovUX9xUD5E/9/Su5DBGjO8ZXyFPh6oFOz1UeQfmR/+GHwQC3Lo9b0OQFPm5m6w5iuE2
	krqBXJ33x65zZYVi6IlqwglwEX+5hB17HnWimYGuTHK+viKZ36dobj0d46ZZdmlyM9KYFyhLO3ZSt
	V2ewfBdfeDMEJMhD4GzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG8O-0000000GLK6-3ziJ;
	Mon, 27 Apr 2026 07:12:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG8M-0000000GLJi-3R8d
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 07:12:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6764e36dc88so10755353a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 00:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777273916; cv=none;
        d=google.com; s=arc-20240605;
        b=UG545ykvnuWfz94m2q0X/s9269ucJzsWWhg1Hdf0350bWNUs91Aliq0b5xnNHNm4ii
         WetFyDsKb/F9uMnmCLepZo3uWJcH8Va5W9JmC0N4ppsZuN/Nr6D6emxhr//03jBiDyJK
         Feudx/vJrzC/IAPwuwmrtm5MazMP9GxI7yWzaUsbS8baGN6aJGXc8yXyyhRUjmukSWtF
         WJdbNRSOI7b611hxg2KS4wlADfDyhM9Ox2sbGKtq1NFcMvXYJhVV3X+GVRfkal8UWCKA
         va/gaHcuQAT+hT1e82W5yaMz7XaFs3J1a62eBWrWcNVCq4CuzaXAAnIfEMKAYIXPl/2D
         eB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uumcmmavSfi2/E7On14mQI/gbuLJT7hRNnaf6ptvXrQ=;
        fh=dG1LBy0ZlFhJvwUPqm5DKdHi/rqh7C5yQ4y68R2YNzM=;
        b=MpjcnE/OeykBn8t8qzfNZDvM0moootCuVZN4Ltzix6GuAVZXHQMUc+6aP+nNz9jC7q
         6gSSw0vLiNm6A09KuFdqQl0v9Lkwjb5z3rIWdLq0ZdgNN2m69TqXiX5kzCUZVZBU3aad
         T2cGbPCL6DUrvmx+AoIEDovOzERSY5tdRgwvD36d+aajRO8rUCtHHnwp0kFIn8++6xM2
         42OxKgJNMceG1qY9j2TEl5gsuLoE8RMEW0qaTh6zGLAGyFWt6WBFEE/AEnz+cGo6x8dg
         kMwNajhwywv7c36iUDF13FoaY6FTtTSCZrUr9mItC/svQuZI8bfSEe44S3RTbBG6DoFE
         Fdmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777273916; x=1777878716; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uumcmmavSfi2/E7On14mQI/gbuLJT7hRNnaf6ptvXrQ=;
        b=js9e9MsMMWrAPKUsU1JeMr7g6SFlZ1EFuKMJvKKliWOSl475S1dlZzwiE0kcmVnZkT
         sYwOUc/a027zR8VayekovvlNKs9UFkhFDDVtreAF+wQDJ/Ns5uf0NDVlpo5t4Mzajugp
         IJcrIDnpaslmA6CVexS9HnJJh1mXQVBLmks1HcP5aai6DXAGWzhNdevCfN5NOWEY9JQb
         kcB1PAQGNbsZ5vgM3sNsAOnKJIzj6IuO7kcre1zzzDAEmgMvTMfCk9uwCwy7GmpdJlP+
         TVzQBkOdgv+9zA5hZ64Wqr2V7R7YpiuKRLwdc+JFoNKGByrqW9MXydyBzXTYloagfIy1
         J3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273916; x=1777878716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uumcmmavSfi2/E7On14mQI/gbuLJT7hRNnaf6ptvXrQ=;
        b=PqziVpWdwrlSiR0Pk+7Vcsm0aDIZdEgULnasoHxoz0mIE0i6aIlqAQKxWcbRubFDE5
         WCwfRV70+38CYp7jXW3GQ97m773tzn33OPQXQmM1ZwQHxjmMQH6KENAd0zekruNzjKIv
         /hVKIlznb4t/tWUsFCudythjBAh97/CFekKWspSPw1yWgnbslpVNsTjmVdK88Q13OAef
         2zWH2UMhqgietUWnRRmkE3TLY2ArS9OriVN1chflxlB3AjhZD0n8iJFD2iLUEzOTJDkR
         rvkGtsHNGQAjdgXP04QDHUL8bwHV9a5cfkKH2XlOzzFuHQvd03983y3uvfChmobAH1no
         SFmA==
X-Forwarded-Encrypted: i=1; AFNElJ+Yh5U9UVm96Xz8PAkfHagOeu3PQ0GyPsIrwJkFzJiD9ZOMMAANOUzAvT6Cuih5l9PoTzn/wmTlABj8vA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiyKkdKLRZLnMpw+JS0JsL7de+JPaUO21vVxYwbWeuQozJcWJ5
	fqzIxEXD3RBQ871h07/V7UwJKCuvNQHGnOn8cbs9S0DvXqKnBr6FvV+PrtL18acdtgl+M7JJ7OS
	WDdx+Ub295DbJ74BxFhmb/kUOm9GGf3HyeooTwzvYPQ==
X-Gm-Gg: AeBDietq1aY1cj5l5OR+lckFpovNQz7gz8Mpd8TOn94ihptNeOaxGrnhjBs5LshdFT/
	UkTIeBdbQ6qGWxxGymrbHQdbhxuwnZz9KW0t9doMF4UcDE26l1GyKwFHjSqlz2161EAgYAMdIzU
	zmBf+PNRlhnvoH778Qo+lAl+dLPdrV+kWUM9v1od1FSwsQp1uGwJeWqmAe8rVjVSW/2xDsghJKc
	LAtV98GZTbv0pAH2eYRkqeITnghJvZmXE4968OxFWKlMdg1wvjtvT7JXASgSB5E/00TmuyLDvcf
	YlncMH0xyhdo2XXrAkX3Dt1VnyrAlqw=
X-Received: by 2002:a17:906:f589:b0:b9c:bf69:8b54 with SMTP id
 a640c23a62f3a-ba422fdd728mr1748492166b.18.1777273915967; Mon, 27 Apr 2026
 00:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260424065540.3480755-1-zong.li@sifive.com> <20260424102645.14fa41cd@pumpkin>
In-Reply-To: <20260424102645.14fa41cd@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 27 Apr 2026 15:11:43 +0800
X-Gm-Features: AVHnY4LAz6LBveiKeCDsAQB0gU4nXFaTldJFk0P6J6bEEJ8ug7ZbkOhTRBeIOFU
Message-ID: <CANXhq0qdToeS101Bz=Woq05Sf8bNG1BJjs0WrOVtiq19eMQ3bg@mail.gmail.com>
Subject: Re: [PATCH] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_001159_045776_177829FF 
X-CRM114-Status: GOOD (  29.43  )
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgYXQgNToyNuKAr1BNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIzIEFwciAyMDI2IDIzOjU1
OjQwIC0wNzAwCj4gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gRm9s
bG93IHRoZSBBUk02NCBHQ1MgKEd1YXJkZWQgQ29udHJvbCBTdGFjaykgaW1wbGVtZW50YXRpb24g
YXBwcm9hY2gKPiA+IGJ5IHJlZHVjaW5nIHRoZSBzaGFkb3cgc3RhY2sgc2l6ZSBhbGxvY2F0aW9u
IGZyb20gbWluKFJMSU1JVF9TVEFDSywgNEdCKQo+ID4gdG8gbWluKFJMSU1JVF9TVEFDSy8yLCAy
R0IpLiBzZWUgY29tbWl0ICc1MDY0OTZiY2JiNDIgImFybTY0L2djczogRW5zdXJlCj4gPiB0aGF0
IG5ldyB0aHJlYWRzIGhhdmUgYSBHQ1MiKScKPiA+Cj4gPiBSYXRpb25hbGU6Cj4gPgo+ID4gMS4g
U2hhZG93IHN0YWNrcyBvbmx5IHN0b3JlIHJldHVybiBhZGRyZXNzZXMgKDggYnl0ZXMgcGVyIGVu
dHJ5KSwgbm90Cj4gPiAgICBsb2NhbCB2YXJpYWJsZXMsIGZ1bmN0aW9uIHBhcmFtZXRlcnMsIG9y
IHNhdmVkIHJlZ2lzdGVycy4gQSAyR0IKPiA+ICAgIHNoYWRvdyBzdGFjayBpcyBmYXIgbW9yZSB0
aGFuIHN1ZmZpY2llbnQgZm9yIGFueSBwcmFjdGljYWwKPiA+ICAgIGFwcGxpY2F0aW9uLCBldmVu
IHdpdGggZXh0cmVtZWx5IGRlZXAgcmVjdXJzaW9uLiBVc2luZyBoYWxmIHRoZSBzaXplCj4gPiAg
ICBtYWludGFpbnMgYWRlcXVhdGUgd2hpbGUgYmVpbmcgbW9yZSByZXNvdXJjZS1lZmZpY2llbnQg
bWFyZ2luCj4gPgo+ID4gMi4gT24gbWVtb3J5LWNvbnN0cmFpbmVkIHN5c3RlbXMgKGUuZy4sIHBs
YXRmb3JtcyB3aXRoIG9ubHkgNEdCIG9mCj4gPiAgICBwaHlzaWNhbCBtZW1vcnksIHdoaWNoIGlz
IGEgY29tbW9uIGNvbmZpZ3VyYXRpb24pLCBhbGxvY2F0aW5nIDRHQgo+ID4gICAgb2YgdmlydHVh
bCBhZGRyZXNzIHNwYWNlIGZvciBzaGFkb3cgc3RhY2sgcGVyIHByb2Nlc3MvdGhyZWFkIGNhbgo+
ID4gICAgbGVhZCB0byB2aXJ0dWFsIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmVzIHdoZW4gdGhl
IG92ZXJjb21taXQgbW9kZQo+ID4gICAgaXMgc2V0IHRvIE9WRVJDT01NSVRfR1VFU1Mgb3IgT1ZF
UkNPTU1JVF9ORVZFUjoKPiA+ICAgIEVycm9yOiAiX192bV9lbm91Z2hfbWVtb3J5OiBub3QgZW5v
dWdoIG1lbW9yeSBmb3IgdGhlIGFsbG9jYXRpb24iCj4gPgo+ID4gVGhpcyByZWR1Y2VzIHZpcnR1
YWwgYWRkcmVzcyBzcGFjZSBjb25zdW1wdGlvbiBieSA1MCUgd2hpbGUgbWFpbnRhaW5pbmcKPiA+
IG1vcmUgdGhhbiBhZGVxdWF0ZSBzcGFjZSBmb3IgcmV0dXJuIGFkZHJlc3Mgc3RvcmFnZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgfCA3ICsrKystLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91c2Vy
Y2ZpLmMKPiA+IGluZGV4IDZlYWEwZDk0ZmRmZS4uNGE0OGRkMjhkMTEzIDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC91c2VyY2ZpLmMKPiA+IEBAIC0xMDksMTUgKzEwOSwxNiBAQCB2b2lkIHNldF9pbmRpcl9scF9s
b2NrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBsb2NrKQo+ID4gICAgICAgdGFzay0+
dGhyZWFkX2luZm8udXNlcl9jZmlfc3RhdGUudWZjZmlfbG9ja2VkID0gbG9jazsKPiA+ICB9Cj4g
PiAgLyoKPiA+IC0gKiBJZiBzaXplIGlzIDAsIHRoZW4gdG8gYmUgY29tcGF0aWJsZSB3aXRoIHJl
Z3VsYXIgc3RhY2sgd2Ugd2FudCBpdCB0byBiZSBhcyBiaWcgYXMKPiA+IC0gKiByZWd1bGFyIHN0
YWNrLiBFbHNlIFBBR0VfQUxJR04gaXQgYW5kIHJldHVybiBiYWNrCj4gPiArICogVGhlIHNoYWRv
dyBzdGFjayBvbmx5IHN0b3JlcyB0aGUgcmV0dXJuIGFkZHJlc3MgYW5kIG5vdCBhbnkgdmFyaWFi
bGVzCj4gPiArICogdGhpcyBzaG91bGQgYmUgbW9yZSB0aGFuIHN1ZmZpY2llbnQgZm9yIG1vc3Qg
YXBwbGljYXRpb25zLgo+ID4gKyAqIEVsc2UgUEFHRV9BTElHTiBpdCBhbmQgcmV0dXJuIGJhY2sK
PiA+ICAgKi8KPiA+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBjYWxjX3Noc3RrX3NpemUodW5zaWdu
ZWQgbG9uZyBzaXplKQo+ID4gIHsKPiA+ICAgICAgIGlmIChzaXplKQo+ID4gICAgICAgICAgICAg
ICByZXR1cm4gUEFHRV9BTElHTihzaXplKTsKPiA+Cj4gPiAtICAgICByZXR1cm4gUEFHRV9BTElH
TihtaW5fdCh1bnNpZ25lZCBsb25nIGxvbmcsIHJsaW1pdChSTElNSVRfU1RBQ0spLCBTWl80Rykp
Owo+ID4gKyAgICAgcmV0dXJuIFBBR0VfQUxJR04obWluX3QodW5zaWduZWQgbG9uZyBsb25nLCBy
bGltaXQoUkxJTUlUX1NUQUNLKSAvIDIsIFNaXzJHKSk7Cj4KPiBVc2UgbWluKCkgaW5zdGVhZCBv
ZiBtaW5fdCgpLgo+IEFsbCB0aGUgdmFsdWVzIChiZWZvcmUgYW5kIGFmdGVyIHRoZSBwYXRjaCkg
YXJlIHVuc2lnbmVkLgoKVGhhbmtzLiBJIHdpbGwgbW9kaWZ5IGl0IGluIHRoZSBuZXh0IHZlcnNp
b24uCgo+Cj4gICAgICAgICBEYXZpZAo+Cj4KPiA+ICB9Cj4gPgo+ID4gIC8qCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
