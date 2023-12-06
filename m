Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A623C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hs7sxFfK1kJfdnuT9r8kUr3HgEoAOt0uiGc0x9xflV8=; b=mwYdg+Q1qscn4m
	95h3klcypfNYu2bHC4H4RY66jBnoi4+WjPM4b5+zXKMn0MqhPIwZsIhjFs3xK1u56sFRJhwj8unKy
	sKUmfA/f3jxYezm3Al1ahDsM6OCZd1+vTCtZqv4e2xCMrLOTGUIpVz96PTLwVChZJ68fXGHwlx9A5
	1erqADLVOPE6f1bX6+kMfuYyHBU7m7hS4YQCa0kI6s5LAtXe0hJECL6flZREE73JxIK/k2D2HTqCB
	V5F1+qHvTA+MTT+wLA+3cwi0tJu+7PBdyH29/16FkE4AP8DoNffjfj0iRK8ss5BEfQhfIH9/wNZ18
	FV91JWOPmHKxLVREBWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfQ9-008gv4-29;
	Wed, 06 Dec 2023 00:05:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfQ6-008gug-32
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 00:05:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bf32c0140so3709604e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 16:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701821138; x=1702425938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP7nKtWfYoUzguTS/VKVOS7gViQ15zCDVCS0hR/PhBI=;
        b=e2nb608M+4uLcWqDd+gsM4LP2tAcfJdPoJfKSv0KDbbFaFzPAmGWLrBoOseKpxgmJo
         zjEjLatjSiQ2ehbIBsY+tWYHlSE+WB4fQhCfRbZIUweoSZ4ffomx+2IiRdY7VPwGeDMB
         ls/5wQEoaKoiTpKEuz88aR1J23mFTrWN8kteXiz723NBpvVNkrucNcPGhxnxuhOwPfR8
         XXAww26rliYOV1saVCJ7eNUMyYNevKdVlPSf3uGMS8PvyvDYN8FnbSISGhFNd8K5i+eb
         JIb4bNZQf7gmq9UmTlzO3NJLnVHl81ek/ogSSVR7GV0IvZAX36OCgIqzFIZhVNKHgH1v
         QI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701821138; x=1702425938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RP7nKtWfYoUzguTS/VKVOS7gViQ15zCDVCS0hR/PhBI=;
        b=a5NLSmDqDoNLr+XhObAVm66cDDKyqAD22L/NsC3ssYeFKDjM3AJ1zwkc8Sdf1Z/XUd
         xuVM2H5/RUmqBV4DR+YaR3MrhNDihdxd8RbmntSeoa44guJsf09Cmu1WUdvzNlTva8bV
         TEGOph57a3msaerEpRdiAJuYzvDWbysMkzo04/a+jY1RqwFczKWFUi2QZMFChZbH4aCX
         DqYZ2A/FQS8biMB078Y4sOohI9Dgn4vluHeDY2o7/ICUW9CJ27dg/zmjGj1FNcMChrSx
         hW1mL9CDN00UhgGq+YI5YDFPR9V4p2pviFrT5LwmMbkqrD+DojkjMrDRqBX6kUeSAif6
         kXYw==
X-Gm-Message-State: AOJu0YxzYkG8XD+NhHcwqZR9/CCHLNnr0PYHo7YBuKuIO5t4ezdaSZ26
	AVjeuShqG7O7Xp6u3quer/8vDTetyYg89Jjyl9s=
X-Google-Smtp-Source: AGHT+IGKktn7HHDLwAV42qseKcbMNbVaXmATh5nrHRAX4Ogdmds+Zagcmt4Suf2Kbh5Gotw6pwae5Mv3w4NK3vKK6E8=
X-Received: by 2002:a05:6512:3585:b0:50b:f3fc:125d with SMTP id
 m5-20020a056512358500b0050bf3fc125dmr42122lfr.38.1701821138330; Tue, 05 Dec
 2023 16:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20231203135753.1575-1-jszhang@kernel.org> <20231203135753.1575-2-jszhang@kernel.org>
 <ZW4lUDpl0eZVNjrp@ghost> <20231205021406.GD1168@sol.localdomain>
 <ZW8rbgsTqmuLTvoK@xhacker> <ZW+Oc8sJNcPLWk1Q@ghost>
In-Reply-To: <ZW+Oc8sJNcPLWk1Q@ghost>
From: Charles Lohr <lohr85@gmail.com>
Date: Tue, 5 Dec 2023 16:05:27 -0800
Message-ID: <CAGu26P9KiZQhTGO1TrRzGV86GjivmC7_HQaE5p_kNemx+euaEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_160542_984039_A4A0472B 
X-CRM114-Status: GOOD (  34.07  )
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

VGhlIGF1dG9tYXRpYyBkZXRlY3Rpb24gY29kZSBoYXMgYmVjb21lIGEgYml0IG9mIGEgdGhvcm4g
Ym90aCBmb3IKZm9sa3MgbGlrZSBtZSB3aG8gdXNlIHRoZSBrZXJuZWwgZm9yIHNvbWUgZmFzdC1z
cGluIHVwIGFvZHIKdmlydHVhbGl6YXRpb24gKHdoZXJlIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Mg
c29ha3MgdXAgMS80IHRvIDEvMyBvZgp0aGUgdG90YWwgYm9vdCB0aW1lIGFuZCB1bmFsaWduZWQg
YWNjZXNzZXMgYXJlIGFsd2F5cyBmYXN0KSBhcyB3ZWxsIGFzCmNhdXNpbmcgaXNzdWVzIGZvciB0
aGUgRlBHQSBzb2Z0IGNvcmUgZGV2ZWxvcG1lbnQgd2hlcmUgdGhleSBlYXNpbHkKa25vdyBhaGVh
ZCBvZiB0aW1lIHdoYXQgdGhlIHNpdHVhdGlvbiBpcyBnb2luZyB0byBiZS4gIEl0IHdvdWxkIGJl
CmV4dHJlbWVseSB3ZWxjb21lIGlmIHRoZSBhY2Nlc3MgY291bGQgYWx3YXlzIGJlIG92ZXJyaWRk
ZW4gd2l0aCBhCmNvbmZpZyB2YWx1ZSB0aGF0IGNvdWxkIGVpdGhlciBmb3JjZSBvbiBvciBmb3Jj
ZSBvZmYgdW5hbGlnbmVkIGFjY2VzcwphbmQgYXZvaWQgZXhlY3V0aW9uIG9mIHRoZSBjaGVjayBm
dW5jdGlvbiBwZXJtYW5lbnRseS4gIEkgZG9uJ3Qgc2VlIGEKd29ybGQgd2hlcmUgZm9yIHNvbWUg
b2YgdXMsIHdlIHdvdWxkIGV2ZXIgd2FudCBhdXRvZGV0ZWN0aW9uIG9uLiAgSW4KdGhlIFJJU0Mt
ViBhcmVuYSwgbWFueSB0aW1lcyB3ZSdyZSBkZWFsaW5nIHdpdGggdmVyeSBzbWFsbCBzeXN0ZW1z
CndoZXJlIHRoZSBtYXJnaW5hbCBjb3N0IG9mIGRlYWQgY29kZSBpcyByYXRoZXIgaGlnaC4KCk9u
IFR1ZSwgRGVjIDUsIDIwMjMgYXQgMTI6NTfigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgRGVjIDA1LCAyMDIzIGF0IDA5OjUzOjUw
UE0gKzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiBPbiBNb24sIERlYyAwNCwgMjAyMyBh
dCAwNjoxNDowNlBNIC0wODAwLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgRGVj
IDA0LCAyMDIzIGF0IDExOjE1OjI4QU0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKPiA+ID4gPiA+IGluZGV4IDdmOGFhMjU0NTdiYS4uMGE3NjIwOWU5YjAyIDEwMDY0NAo+ID4g
PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2
L0tjb25maWcKPiA+ID4gPiA+IEBAIC02NTQsNiArNjU0LDE4IEBAIGNvbmZpZyBSSVNDVl9NSVNB
TElHTkVECj4gPiA+ID4gPiAgICAgICAgICAgbG9hZC9zdG9yZSBmb3IgYm90aCBrZXJuZWwgYW5k
IHVzZXJzcGFjZS4gV2hlbiBkaXNhYmxlLCBtaXNhbGlnbmVkCj4gPiA+ID4gPiAgICAgICAgICAg
YWNjZXNzZXMgd2lsbCBnZW5lcmF0ZSBTSUdCVVMgaW4gdXNlcnNwYWNlIGFuZCBwYW5pYyBpbiBr
ZXJuZWwuCj4gPiA+ID4gPgo+ID4gPiA+ID4gK2NvbmZpZyBSSVNDVl9FRkZJQ0lFTlRfVU5BTElH
TkVEX0FDQ0VTUwo+ID4gPiA+Cj4gPiA+ID4gVGhlcmUgYWxyZWFkeSBleGlzdHMgaHdwcm9iZSBm
b3IgdGhpcyBwdXJwb3NlLiBJZiBrZXJuZWwgY29kZSB3YW50cyB0bwo+ID4gPiA+IGxldmVyYWdl
IHRoZSBlZmZpY2llbnQgdW5hbGlnbmVkIGFjY2Vzc2VzIG9mIGhhcmR3YXJlLCBpdCBjYW4gdXNl
IHN0YXRpYwo+ID4gPiA+IGtleXMuIEkgaGF2ZSBhIHBhdGNoIHRoYXQgd2lsbCBzZXQgdGhpcyBz
dGF0aWMga2V5IGlmIHRoZSBoYXJkd2FyZSB3YXMKPiA+ID4gPiBkZXRlY3RlZCB0byBoYXZlIGZh
c3QgdW5hbGlnbmVkIGFjY2Vzc2VzOgo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyMzExMTctb3B0aW1pemVfY2hlY2tzdW0tdjExLTItN2Q5ZDk1
NGZlMzYxQHJpdm9zaW5jLmNvbS8KPiA+ID4KPiA+ID4gSXMgdGhlIHBsYW4gdG8gbWFrZSB0aGUg
Z2V0X3VuYWxpZ25lZCogYW5kIHB1dF91bmFsaWduZWQqIG1hY3JvcyBleHBhbmQgdG8gY29kZQo+
ID4gPiBmb3IgYm90aCBjYXNlcywgYW5kIHNlbGVjdCBiZXR3ZWVuIHRoZW0gdXNpbmcgYSBzdGF0
aWMga2V5PyAgTm90ZSB0aGF0IHRoZXJlIGFyZQo+ID4gPiBhIHZlcnkgbGFyZ2UgbnVtYmVyIG9m
IGNhbGxlcnMgb2YgdGhlc2UgbWFjcm9zIGluIHRoZSBrZXJuZWwuICBBbmQgd2hhdCBhYm91dAo+
ID4gPiBrZXJuZWwgY29kZSB0aGF0IGNoZWNrcyBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElH
TkVEX0FDQ0VTUyBkaXJlY3RseT8KPiA+ID4KPiA+ID4gQUZBSUssIG5vIG90aGVyIExpbnV4IGFy
Y2hpdGVjdHVyZSBzdXBwb3J0cyBrZXJuZWwgaW1hZ2VzIHdoZXJlIHRoZSB1bmFsaWduZWQKPiA+
ID4gYWNjZXNzIHN1cHBvcnQgaXMgdW5rbm93biBhdCBjb21waWxlIHRpbWUuICBJdCdzIG5vdCBj
bGVhciB0byBtZSB0aGF0IHN1Y2ggYW4KPiA+ID4gYXBwcm9hY2ggaXMgZmVhc2libGUuICBBIHN0
YXRpYyBrZXkgY2FuIGVhc2lseSBiZSBwcm92aWRlZCwgYnV0IGl0J3MgdW5jbGVhcgo+ID4gPiB3
aGF0IGNvZGUgd291bGQgdXNlIGl0LCBnaXZlbiB0aGF0IGN1cnJlbnRseSBsb3RzIG9mIGtlcm5l
bCBjb2RlIGFzc3VtZXMgdGhhdAo+ID4gPiB1bmFsaWduZWQgYWNjZXNzIHN1cHBvcnQgaXMga25v
d24gYXQgY29tcGlsZSB0aW1lLgo+ID4gPgo+ID4gPiBNZWFud2hpbGUsIHRoZXJlIGFyZSBwZW9w
bGUgYnVpbGRpbmcga2VybmVscyB0aGV5IGtub3cgd2lsbCBvbmx5IGJlIGRlcGxveWVkIG9uCj4g
PiA+IHN5c3RlbXMgd2hlcmUgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzdXBwb3J0ZWQuICBUbyBt
ZSwgaXQgc2VlbXMgdXNlZnVsIHRvCj4gPiA+IHByb3ZpZGUgYSBrY29uZmlnIG9wdGlvbiBmb3Ig
dGhlbSB0byBidWlsZCBhIG1vcmUgZWZmaWNpZW50IGtlcm5lbC4KPiA+Cj4gPiBHZW5lcmFsbHks
IEkgYWdyZWUgd2l0aCBFcmljJ3MgYWJvdmUgcG9pbnRzLiBWYXJpb3VzIHN1YnN5c3RlbSBzdWNo
IGFzIG5ldCwgbW0sCj4gPiBsaWIgYW5kIHNvIG9uIGhhdmUgZGlmZmVyZW50IGNvZGUgcGF0aCBm
b3IgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MsCj4gPiB3aGlsZSBDaGFy
bGllJ3MgcGF0Y2ggb25seSB0b3VjaCBwYXJ0aWFsIGNvZGUgb2YgYXJjaC9yaXNjdiwgYW5kIGV2
ZW4gaWYgdGhvc2UKPiA+IHN1YnN5c3RlbSBtYWludGFpbmVycyBhZ3JlZSB3aXRoIGR5bmFtaWMg
Y29kZSBwYXRjaGluZyhJIHN0aWxsIGJlbGlldmUKPiA+IHBlcnN1YWRpbmcgdGhvc2Ugc3Vic3lz
dGVtIG1haW50YWluZXJzIGlzIG5vdCBlYXN5KSwgdGhhdCdzIHN0aWxsIGEKPiA+IGh1Z2UgdGFz
ayB3aGljaCBuZWVkcyB0byBiZSBkb25lIHN0ZXAgYnkgc3RlcC4gU28gYmVmb3JlIHRoYXQsIHdl
J2QKPiA+IGJldHRlciBsZXQgdGhpcyBzZXJpZXMgbWVyZ2VkIGFuZCBiZW5lZml0IGFsbCBlZmZp
Y2llbnQgdW5hbGlnbmVkIGFjY2Vzcwo+ID4gcmlzY3Ygc3lzdGVtcy4gV2hlbiB0aGUgaHVnZSB0
YXNrIGlzIGNvbXBsZXRlZCwgd2UgY2FuIHJlbW92ZSB0aGUgY29uZmlnCj4gPiBvcHRpb24uCj4g
Pgo+ID4gVGhhbmtzCj4KPiBJdCB3b3VsZCBiZSBiZXN0IHRvIGVuYWJsZSBhbGwgb2YgdGhlIHBh
dGhzIHRoYXQgbGV2ZXJhZ2UKPiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VT
UyBhdCBydW50aW1lICh1c2luZyBod3Byb2JlKQo+IGluc3RlYWQgb2YgdXNpbmcgYSBjb21waWxl
LXRpbWUgZmxhZyB0byBkbyBzby4gSG93ZXZlciwgYXMgeW91IHNheSwgdGhhdAo+IGlzIGxhcmdl
IHRhc2sgYW5kIGRvZXNuJ3QgbmVlZCB0byBiZSBkb25lIGltbWVkaWF0ZWx5LiBGb3Igbm93IEkg
YWdyZWUKPiBpdCBpcyBzdWZmaWNpZW50IHRvIHVzZSB0aGlzIG5ldyBSSVNDVl9FRkZJQ0lFTlRf
VU5BTElHTkVEX0FDQ0VTUwo+IGNvbmZpZy4KPgo+IC0gQ2hhcmxpZQo+Cj4gUmV2aWV3ZWQtYnk6
IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
