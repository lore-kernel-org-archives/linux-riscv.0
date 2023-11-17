Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E7AC072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVFAmcvZtBTsBKW+UWQYuylF54ua4xCmIfVM2ttu+lU=; b=hRCiYQL//qjO7B
	m06oXr5dmfeGmzPOlDTe/cwsPOJyun78OHq8Pvj7bLQpy3NtUQhIrbVkvUImQ2X4x01JGqKS5qsL4
	i820IV4yAZBuRqcU+i8rj6ihWH9rU7O2NGenx5FJny+xB9iWV3WtOcjEeI5TLBnneM4iIhYMS4VAw
	fbRL51nsBJPDEDPUbB8fgb/xYUS4ybZeYTn2hNclloiUWUrK+krEL/ef0N3/5HJ0rhEMLl8v7ib5W
	zQhP6ngsz1ZubMuEmHDimd2WUg+7oQ2likXvo0Ti00DkunaKsOf2Zrxqr+GNJx2UsfTADBlu7QTLY
	ZPHphXTda872kTnmqeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yWe-006bWv-16;
	Fri, 17 Nov 2023 13:04:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yWZ-006bTV-2c
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 13:04:46 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso1852688b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 05:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1700226279; x=1700831079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/F1OxU0rX7/2Awza+ieBvlQ9jwzfprHoNUntAoYQeA=;
        b=G+TMfqXRd92TVRkhVR9xxiIAtWwJhO/dUkr5yvp8+L0jkjzgn87UOgnUvma2ixSINg
         DCtwy5H1bB/FwRs30Dl2wb5HmVjzPF1V3s+YSSYOKIsUyvtBSfewNPfdYtwg9tzM17Ox
         FAAQ8Qk781tZhgU7fjROlzQmtUCK6kaU81SM8B6sfleGJ7OAAYmWWxjQ+segsyIWyHcq
         y+O2qZPM6kxnCJhM3W8CXMSjSeX8hLlwl4ZegkeEKHTEBgIyz2VZQZYmNf0gsYSreDAY
         QlVdl/aP5ilgn4LLkjWCM48R4yqYsrt2zIz10nfC7d+zJVEX8Sm6vI6hLxshoSiLvH57
         WZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700226279; x=1700831079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/F1OxU0rX7/2Awza+ieBvlQ9jwzfprHoNUntAoYQeA=;
        b=jqbsgI85DCcW8fVuHTsaa47B4XifRU33BVGIlwSDAeFXX7hL+uMHZBx7Z1voHETbEO
         QIfm9gOFRZLcpLKS4ppArLyxL8WutcYKbKO/ugRaS2fd6XR00JE095lOagAlqws7RcJW
         s7Ac8RvuNmudnvEMkpPs8ArsMxAvDGIN2S0CehAXWJk2HDopRBZ5t9EXTjquprso/JdS
         zt2cSgLStVC491R7WVZzrOi7fn9Ef7nsqXjqNJvx0AQ8x/wT7ygwnH3utfkk2noKeRIK
         x9ShaVzh7hlKHhfWMyQTGiT2czOZIs/QsUr4dx2HnDViOk4oEl/ittBeknhiBBrFNMez
         2pXQ==
X-Gm-Message-State: AOJu0YxfODtBU72J8qocfdXNyp/tbplIvIaP2+PwSAB3bRRW2KN6mVh1
	V/Si9I1+hU+FMzuCtalq0fXDysIOdthDQYtvF+ZhBw==
X-Google-Smtp-Source: AGHT+IEtPzE7lEOx2d7Ysp4LwrL/GBmShcmNUU9lJo3FtmpAf6sriMDVi9emlG1mMx8Yan2mKYsw1q3eMsjqCt3Pm70=
X-Received: by 2002:a17:90b:3904:b0:274:8949:d834 with SMTP id
 ob4-20020a17090b390400b002748949d834mr13014202pjb.49.1700226278671; Fri, 17
 Nov 2023 05:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-7-apatel@ventanamicro.com> <2023102113-harsh-trout-be8f@gregkh>
In-Reply-To: <2023102113-harsh-trout-be8f@gregkh>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 18:34:27 +0530
Message-ID: <CAAhSdy1Beq-Qnio3E+Am0jVQ7ECaWa1HH2A1JkWRPN5y8tsgAQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_050444_064940_441E3E3E 
X-CRM114-Status: GOOD (  17.25  )
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

T24gU2F0LCBPY3QgMjEsIDIwMjMgYXQgMTA6MDXigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIz
IGF0IDEyOjUxOjM3UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgZnVuY3Rpb25z
IHNiaV9jb25zb2xlX3B1dGNoYXIoKSBhbmQgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpIGFyZQo+ID4g
bm90IGRlZmluZWQgd2hlbiBDT05GSUdfUklTQ1ZfU0JJX1YwMSBpcyBkaXNhYmxlZCBzbyBsZXQg
dXMgYWRkCj4gPiBzdHViIG9mIHRoZXNlIGZ1bmN0aW9ucyB0byBhdm9pZCAiI2lmZGVmIiBvbiB1
c2VyIHNpZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFu
YW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCA1
ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9zYmkuaAo+ID4gaW5kZXggMTJkZmRhNmJiOTI0Li5jYmNlZmEzNDQ0MTcgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiBAQCAtMjcxLDggKzI3MSwxMyBAQCBzdHJ1Y3Qgc2JpcmV0
IHNiaV9lY2FsbChpbnQgZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBsb25nIGFyZzAsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmczLCB1bnNpZ25lZCBsb25nIGFyZzQs
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmc1KTsKPiA+Cj4gPiAr
I2lmZGVmIENPTkZJR19SSVNDVl9TQklfVjAxCj4gPiAgdm9pZCBzYmlfY29uc29sZV9wdXRjaGFy
KGludCBjaCk7Cj4gPiAgaW50IHNiaV9jb25zb2xlX2dldGNoYXIodm9pZCk7Cj4gPiArI2Vsc2UK
PiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2JpX2NvbnNvbGVfcHV0Y2hhcihpbnQgY2gpIHsgfQo+
ID4gK3N0YXRpYyBpbmxpbmUgaW50IHNiaV9jb25zb2xlX2dldGNoYXIodm9pZCkgeyByZXR1cm4g
LTE7IH0KPgo+IFdoeSBub3QgcmV0dXJuIGEgcmVhbCBlcnJvciwgIi0xIiBpc24ndCB0aGF0IDop
CgpBcy1wZXIgU0JJIHNwZWMsIHRoZSBsZWdhY3kgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpIHJldHVy
bnMKLTEgdXBvbiBmYWlsdXJlIGhlbmNlIHRoZSBjb2RlLgoKUmVmZXIsIHNlY3Rpb24gNS4zIG9m
IHRoZSBsYXRlc3QgU0JJIHNwZWMKaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2Evcmlz
Y3Ytc2JpLWRvYy9yZWxlYXNlcy9kb3dubG9hZC9jb21taXQtZmU0NTYyNTMyYTljYzU3ZTU3NDNi
NjQ2Njk0NmM1ZTVjOThjNzNjYS9yaXNjdi1zYmkucGRmCgpBbHRob3VnaCwgdGhlIHVzZXJzIG9m
IHRoaXMgZnVuY3Rpb24gb25seSBleHBlY3QgYSBuZWdhdGl2ZQp2YWx1ZSB1cG9uIGZhaWx1cmUg
c28gYmV0dGVyIHRvIHJldHVybiBwcm9wZXIgZXJyb3IgY29kZSBoZXJlLgoKSSB3aWxsIHVwZGF0
ZS4KCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAo+Cj4gLS0KPiBrdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cj4ga3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgoKUmVnYXJkcywKQW51cAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
