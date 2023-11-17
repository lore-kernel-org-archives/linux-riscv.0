Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD54DC072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70ZwcggH8nsl3noovTNqP4ywchvTd5sXioxuI9GpugI=; b=TKjCX7k+GSYAeU
	wRyCRy1JrPVlvZXYN3vuFpG2aDZeuDk5FSFhT0qnhXkLTBjgGJKR44bNiK6qfmDhNNUlixluZHJrs
	RZ6xMu7fL+tYJEBhq0SFFQYbXBuYb4AHpqZHYd/9cr2fPdWqR8AA+OvIZqVNlGDKAGloPkpbaCWGh
	jXfY1JGM9YATUrWhOubI0duyeCEar1eefMGobybpmIidOlp7l3949WI0YePp5AaYZk82ULKZIsNXS
	EIQctoShE5tb+kFZNj9vdbIRZ2SnLn8If/HrcGmDjo0rxNlWLKUXVnpNUVjL3bkpgMgSrX/4oQc+c
	zPb84kxPk24p0+wxgUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ycX-006cTU-0D;
	Fri, 17 Nov 2023 13:10:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ycU-006cRr-26
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 13:10:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b20a48522fso1815787b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1700226647; x=1700831447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKUefcBQ+EC714qLkuUiemu7uqNkdjRTt9mSK5vZdm4=;
        b=rNBdLdwbme+BXYlXRsUytxpLchUZ3R6e/9L5ywIojEFy5G0VdcL30ZDg6dDbdTSm7f
         yUS9LgHFuY/fZvjlGhT+vqIWcJN/XCTk2F9lLELMWi9OR4x/1S8lqLCzD+38phDLXGtu
         Knc6QCPknL0YBRVIHTzF9tg8EP0BMmM8VWZigoGxNg1ABivRKPNfK3jbdXRvtBCE/Lpy
         aCI3vIDn5QCm0BrPieOgshA5OR4oPu7tn63VivzNAV32rLIGBrMIuKyiFvC52DWL3Vq8
         GJSZkkKUhykKV3VmzvTz+ftP15HsLae2Bn/4u9Z2bEyIv+6tY26bPmtgo/2+1z4NEzhr
         pgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700226647; x=1700831447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKUefcBQ+EC714qLkuUiemu7uqNkdjRTt9mSK5vZdm4=;
        b=b7uSskFcvOopkjE5rsDd2MezDc0DcfSV4yiEYtGkAncyS6iDRNV9rYnMHtlo6LYP1/
         YxDNTUs4peqqUb+tyqD9uu9jNSk+MvYACsqNP5+Re4GgmFBcKadxFSLlUNSh0VERuY16
         u523Fmo45Pm9N8SoAugX7dUYB5NIU1K8P5bh5OLkBM7bsaNTovTssM6CSrrbVJQ+h7fG
         Bo/N//5ajtHkcPQvpP4tMBCReJZ6YfWBRaauHS753W086suF9edf6a8kG65Ew+yH2cyo
         88PX4FFPuHfZ2XWZCZhOtHGwSxyD/8zLbjIMjFuhKr8auNQKDv1OYDicoXxCMOLdkgqA
         E1ZA==
X-Gm-Message-State: AOJu0YzN7YeA69m2Y0Mo3iqO7pb4+9TL0IgqPA5KgSW0RLG6/6r3/iMl
	L0zlm22wjoLODw07dIFMh0uipSVYA3Ha023g6lSATw==
X-Google-Smtp-Source: AGHT+IHkg0ZKJ4yedCIcxWQHHEubuHsTtpsWiqkyZpXCgKHU9OBeXbOYTtFhOxXyPH/P1PauHAoacm075bpURMWJLoo=
X-Received: by 2002:a05:6a20:3c91:b0:187:eb60:d6de with SMTP id
 b17-20020a056a203c9100b00187eb60d6demr3743444pzj.27.1700226647148; Fri, 17
 Nov 2023 05:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-8-apatel@ventanamicro.com> <2023102120-unleveled-composed-45a2@gregkh>
In-Reply-To: <2023102120-unleveled-composed-45a2@gregkh>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 18:40:35 +0530
Message-ID: <CAAhSdy00LaD0OLJ1ANtyAm41cCLfRX7SPM=A=4WrG_6bB=9xng@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] tty/serial: Add RISC-V SBI debug console based earlycon
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_051050_699594_C121D0C7 
X-CRM114-Status: GOOD (  28.71  )
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

T24gU2F0LCBPY3QgMjEsIDIwMjMgYXQgMTA6MTbigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIz
IGF0IDEyOjUxOjM4UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBXZSBleHRlbmQgdGhl
IGV4aXN0aW5nIFJJU0MtViBTQkkgZWFybHljb24gc3VwcG9ydCB0byB1c2UgdGhlIG5ldwo+ID4g
UklTQy1WIFNCSSBkZWJ1ZyBjb25zb2xlIGV4dGVuc2lvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy90dHkvc2VyaWFsL0tjb25maWcgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBkcml2ZXJzL3R0
eS9zZXJpYWwvZWFybHljb24tcmlzY3Ytc2JpLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKyst
LS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZyBiL2RyaXZl
cnMvdHR5L3NlcmlhbC9LY29uZmlnCj4gPiBpbmRleCBiZGM1NjhhNGFiNjYuLmNlYzQ2MDkxYTcx
NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4gPiArKysgYi9k
cml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+ID4gQEAgLTg3LDcgKzg3LDcgQEAgY29uZmlnIFNF
UklBTF9FQVJMWUNPTl9TRU1JSE9TVAo+ID4KPiA+ICBjb25maWcgU0VSSUFMX0VBUkxZQ09OX1JJ
U0NWX1NCSQo+ID4gICAgICAgYm9vbCAiRWFybHkgY29uc29sZSB1c2luZyBSSVNDLVYgU0JJIgo+
ID4gLSAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQklfVjAxCj4gPiArICAgICBkZXBlbmRzIG9uIFJJ
U0NWX1NCSQo+ID4gICAgICAgc2VsZWN0IFNFUklBTF9DT1JFCj4gPiAgICAgICBzZWxlY3QgU0VS
SUFMX0NPUkVfQ09OU09MRQo+ID4gICAgICAgc2VsZWN0IFNFUklBTF9FQVJMWUNPTgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9lYXJseWNvbi1yaXNjdi1zYmkuYyBiL2RyaXZl
cnMvdHR5L3NlcmlhbC9lYXJseWNvbi1yaXNjdi1zYmkuYwo+ID4gaW5kZXggMjdhZmIwYjc0ZWE3
Li5jMjFjZGVmMjU0ZTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvZWFybHlj
b24tcmlzY3Ytc2JpLmMKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9lYXJseWNvbi1yaXNj
di1zYmkuYwo+ID4gQEAgLTE1LDE3ICsxNSw0MSBAQCBzdGF0aWMgdm9pZCBzYmlfcHV0YyhzdHJ1
Y3QgdWFydF9wb3J0ICpwb3J0LCB1bnNpZ25lZCBjaGFyIGMpCj4gPiAgICAgICBzYmlfY29uc29s
ZV9wdXRjaGFyKGMpOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIHZvaWQgc2JpX2NvbnNvbGVfd3Jp
dGUoc3RydWN0IGNvbnNvbGUgKmNvbiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpzLCB1bnNpZ25lZCBuKQo+ID4gK3N0YXRpYyB2b2lkIHNiaV8wXzFfY29uc29s
ZV93cml0ZShzdHJ1Y3QgY29uc29sZSAqY29uLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpzLCB1bnNpZ25lZCBpbnQgbikKPiA+ICB7Cj4gPiAgICAgICBz
dHJ1Y3QgZWFybHljb25fZGV2aWNlICpkZXYgPSBjb24tPmRhdGE7Cj4gPiAgICAgICB1YXJ0X2Nv
bnNvbGVfd3JpdGUoJmRldi0+cG9ydCwgcywgbiwgc2JpX3B1dGMpOwo+ID4gIH0KPiA+Cj4gPiAr
c3RhdGljIHZvaWQgc2JpX2RiY25fY29uc29sZV93cml0ZShzdHJ1Y3QgY29uc29sZSAqY29uLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcywgdW5zaWdu
ZWQgaW50IG4pCj4gPiArewo+ID4gKyAgICAgcGh5c19hZGRyX3QgcGEgPSBfX3BhKHMpOwo+ID4g
Kwo+ID4gKyAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiA+ICsgICAgICAgICAg
ICAgc2JpX2VjYWxsKFNCSV9FWFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNPTEVfV1JJVEUsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBuLCBsb3dlcl8zMl9iaXRzKHBhKSwgdXBwZXJfMzJf
Yml0cyhwYSksIDAsIDAsIDApOwo+ID4gKyAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICBzYmlf
ZWNhbGwoU0JJX0VYVF9EQkNOLCBTQklfRVhUX0RCQ05fQ09OU09MRV9XUklURSwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIG4sIHBhLCAwLCAwLCAwLCAwKTsKPgo+IFRoaXMgaXMgc3RpbGwg
YSBiaXQgaGFyZCB0byBmb2xsb3csIGFuZCBJIGd1YXJhbnRlZSBpdCB3aWxsIGJlIGEgcGFpbiB0
bwo+IG1haW50YWluIG92ZXIgdGltZSwgdHJ5aW5nIHRvIGtlZXAgYm90aCBjYWxscyBpbiBzeW5j
LCByaWdodD8KPgo+IFdoeSBub3QgZml4IHVwIHNiaV9lY2FsbCgpIHRvIGdldCB0aGlzIGNvcnJl
Y3QgaW5zdGVhZD8gIEl0IHNob3VsZCBiZQo+IGhhbmRsaW5nIHBoeXNfYWRkcl90IHZhbHVlcywg
bm90IGZvcmNpbmcgeW91IHRvIGRvIG9kZCBiaXQgbWFza2luZyBldmVyeQo+IHNpbmdsZSB0aW1l
IHlvdSBjYWxsIGl0LCByaWdodD8gIFRoYXQgd291bGQgbWFrZSB0aGluZ3MgbXVjaCBlYXNpZXIK
PiBvdmVyYWxsLCBhbmQgdGhpcyBwYXRjaCBzaW1wbGVyLCBhcyB3ZWxsIGFzIHRoZSBuZXh0IG9u
ZS4KCk9uIFJWMzIgc3lzdGVtcywgdGhlIHBoeXNpY2FsIGFkZHJlc3MgY2FuIGJlIDM0Yml0cyB3
aWRlIGhlbmNlCnRoZSBvbiBSVjMyIHdlIGhhdmUgdG8gcGFzcyBwaHlzaWNhbCBhZGRyZXNzIGFz
IHR3byBwYXJhbWV0ZXJzCndoZXJlYXMgb24gUlY2NCBlbnRpZXIgcGh5c2ljYWwgYWRkcmVzcyBj
YW4gYmUgcGFzc2VkIGFzIHNpbmdsZQpwYXJhbWV0ZXIuCgo+Cj4gT2ggd2FpdCwgc2JpX2VjYWxs
KCkgaXMgY3JhenksIGFuZCBqdXN0IGEgcGFzcy10aHJvdWdoLCBzbyB0aGF0J3Mgbm90Cj4gZ29p
bmcgdG8gd29yaywgeW91IG5lZWQgYSB3cmFwcGVyIGZ1bmN0aW9uIGZvciB0aGlzIG1lc3MgdG8g
ZG8gdGhhdCBiaXQKPiB0d2lkZGVsaW5nIGZvciB5b3UgaW5zdGVhZCBvZiBmb3JjaW5nIHlvdSB0
byBkbyBpdCBlYWNoIHRpbWUsIEkgZ3Vlc3MKPiB0aGF0J3Mgd2hhdCB5b3UgYXJlIHRyeWluZyB0
byBkbyBoZXJlLCBidXQgaWNrLCBpcyBpdCBjb3JyZWN0PwoKWWVzLCBpdCBpcyBiZXR0ZXIgdG8g
aGF2ZSBhIHdyYXBwZXIgZnVuY3Rpb24gdG8gaGlkZSB0aGUgZGlmZmVyZW5jZXMKb2YgUlYzMiBh
bmQgUlY2NCBzeXN0ZW1zLiBJIHdpbGwgdXBkYXRlLgoKPgo+IHRoYW5rcywKPgo+IGdyZWcgay1o
Cj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
