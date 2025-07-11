Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077DC83F22
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSu2GjLXi/eGxlhtxCYg7qy5wxAmIqicejQ7QmR6Xng=; b=EbUAER79xpSPLv
	42J3Y4/DMg3i6B0RLmw25whkj9prUkAaBA+slP06nGsivgvBzh7Qu86Mo06cMRalt+oXWMTz0AVf5
	numv2u3XRducsibQZhhm4pBmFX0l9FQUIGwu363fr+r4DJtcQyfSUP41/ctvv3brqxP1uNPWx4BFw
	lU0v9c2TA9Ml1Z8vZudF8mIqf8Ig7pNH8oCQ8W84c04HmMh3/rJCkM9HbmKM/+dp69U/WwVv0DY1Q
	meiG+nAMoxNSd52pE/Q3TQTQmD6KRPynEd15FVfGb3MPuXOGRrJxIe7ZPCWe8qrOZ2Qq/7a4AYMgb
	EPJfeX5Rbhx5bNd99X+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaA3t-0000000EIx3-2BcU;
	Fri, 11 Jul 2025 09:28:57 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua97c-0000000E8bp-2IYY
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 08:28:46 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-32b7123edb9so20695201fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752222522; x=1752827322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V0DETkdpP2SJ8ZAwZpM11qaGZR3zWsJjRJIwEWhwAQ=;
        b=bdo8vTm1hJnQNMFtlphbhtYmOEQ6LHFShh7ybh+HLGm5wRrl6Gv7a7ik9fvvOpxRkF
         gV+DOL8wRr/gqVAjFzkPJIoDTT+OcH1gn8HSNipFM5nEEujrDZJqS96+lLSSPBiF59U+
         78MILZDo+qWO7xzuyEjbuOkt+N7uikA1CjiSS2Vm7P4aVaQ3mv+A41W7LLnzl4tSs47A
         OOTD3QX5lxhnwHS0CcggS2j/zYUKI6bLqPg9E8Hxpgzl49Sva2UhIr79Cd2wd+Q8Q5xi
         SHi2yOvCC2huabB3WEYeslRdHEuM7t4qgQOctcFJqCl+p/UAr0YDdKys4yV6Wz2k3vA7
         /kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222522; x=1752827322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V0DETkdpP2SJ8ZAwZpM11qaGZR3zWsJjRJIwEWhwAQ=;
        b=PcrlMG9UbANSaz81Vk+qM5qITc0p6ErgqLA4YDccSr9wCzNrGS/wMYcWgTlvLwDQJg
         w5VsUZ1xqQoByQhopfn/AvFa8fSMSH3SBSVehahULYVhQZKJky7qhQ3icgYZh4zVlc1J
         QjGbiKOJChxLRzNWjwwluvuETZuF5+GItCDfdJ/DSqevY6ScNvdc/yoZOtwvXpyqXskL
         Dn1/T1+/DWHg+5N6aUBVCs9oiV87Rgxoxk0Rd+Q+suWTOiSRW5ywdfjd6FuE6FclImvn
         cEIT3LcsJ9/xX9xFFaz2ekH4R/v44LFdUEcfktvYKW8tiTeGj+hHqPsD2rrDOuPksvx7
         RFJg==
X-Forwarded-Encrypted: i=1; AJvYcCWzPBa/XqEUgRg7xFdr4y2B3bEZapKjMr7/f+V2M4eZdIT6/2dokxpwvgmWrDuLRP/xF8GAqhF8XpgXCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yypv+j/mVofXoaZVYwJjr0ReU3Q9kolAw2oyUiw7BQliG965YQN
	UFK8ATG4P8TeCqnGx9YcZBp070lw7agiHZQJ3wqPPd1CQByej0A4SB3w8Rffl05k9mV5UPDkmzD
	RiZDDceW0E1E8+vWdQTbit6EGtW2rv+irE7SobzXhmg==
X-Gm-Gg: ASbGncuJEmfzJQUqdBNTviLv/NrLBX3Y1+uUaq2DynKsEGw9iMTYkL87sP/z1P/FC3N
	0xyq3eTBnvvXGFLbFJcDZn5B2fQQfjNLK/aFYQ8Pa8WEClCVocprSMWOEMTLrPCjMb+j1+6rlGq
	Gc33VfmWEz0+f9PJHOC/EOLx67Qp8qm9wLbnqUOs5Zq9YqF6w4RImfcWxWXNBGg7P7oYq4NQgJA
	+20/TrITqOEnOiNZ74=
X-Google-Smtp-Source: AGHT+IGtSsp8vscJn4tzXANU6jXxzJIchtHLYA0CLdSkilBhXH8dJCPNqfw6YPZF2NmYpG1AnNSZ4hh9Y0QgbqWWiuk=
X-Received: by 2002:a05:6512:3da3:b0:553:268e:5019 with SMTP id
 2adb3069b0e04-55a044c9ba0mr720126e87.11.1752222522119; Fri, 11 Jul 2025
 01:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250710133030.88940-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250710133030.88940-1-luxu.kernel@bytedance.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 11 Jul 2025 13:58:29 +0530
X-Gm-Features: Ac12FXwuJjdqyUgP0BGYuxw7gbsx-L955BFg8zTc93L-MwymMDnq-8tfsptw_tg
Message-ID: <CAK9=C2W60a2otfJKucJc_d4=X9YBTep1zSp+wa8E7-kL7tJR0Q@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Delegate kvm unhandled faults to VS mode
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: rkrcmar@ventanamicro.com, cleger@rivosinc.com, anup@brainfault.org, 
	atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_012844_594643_7FEF7BC7 
X-CRM114-Status: GOOD (  15.35  )
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgNzowMOKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IERlbGVnYXRlIGZhdWx0cyB3aGljaCBhcmUgbm90IGhhbmRs
ZWQgYnkga3ZtIHRvIFZTIG1vZGUgdG8gYXZvaWQKPiB1bm5lY2Vzc2FyeSB0cmFwcyB0byBIUyBt
b2RlLiBUaGVzZSBmYXVsdHMgaW5jbHVkZSBpbGxlZ2FsIGluc3RydWN0aW9uCj4gZmF1bHQsIGlu
c3RydWN0aW9uIGFjY2VzcyBmYXVsdCwgbG9hZCBhY2Nlc3MgZmF1bHQgYW5kIHN0b3JlIGFjY2Vz
cwo+IGZhdWx0Lgo+Cj4gVGhlIGRlbGVnYXRpb24gb2YgaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVs
dCBpcyBwYXJ0aWN1bGFybHkgaW1wb3J0YW50Cj4gdG8gZ3Vlc3QgYXBwbGljYXRpb25zIHRoYXQg
dXNlIHZlY3RvciBpbnN0cnVjdGlvbnMgZnJlcXVlbnRseS4gSW4gc3VjaAo+IGNhc2VzLCBhbiBp
bGxlZ2FsIGluc3RydWN0aW9uIGZhdWx0IHdpbGwgYmUgcmFpc2VkIHdoZW4gZ3Vlc3QgdXNlciB0
aHJlYWQKPiB1c2VzIHZlY3RvciBpbnN0cnVjdGlvbiB0aGUgZmlyc3QgdGltZSBhbmQgdGhlbiBn
dWVzdCBrZXJuZWwgd2lsbCBlbmFibGUKPiB1c2VyIHRocmVhZCB0byBleGVjdXRlIGZvbGxvd2lu
ZyB2ZWN0b3IgaW5zdHJ1Y3Rpb25zLgo+Cj4gVGhlIGZ3IHBtdSBldmVudCBjb3VudGVycyByZW1h
aW4gdW5kZWxldGVkIHNvIHRoYXQgZ3Vlc3QgY2FuIHN0aWxsIGdldAo+IHRoZXNlIGV2ZW50cyB2
aWEgc2JpIGNhbGwuIEd1ZXN0IHdpbGwgb25seSBzZWUgemVybyBjb3VudCBvbiB0aGVzZQo+IGV2
ZW50cyBhbmQga25vdyAnZmlybXdhcmUnIGhhcyBkZWxlZ2F0ZWQgdGhlc2UgZmF1bHRzLgoKQ3Vy
cmVudGx5LCB3ZSBkb24ndCBkZWxlZ2F0ZSBpbGxlZ2FsIGluc3RydWN0aW9uIGZhdWx0cyBhbmQg
dmFyaW91cwphY2Nlc3MgZmF1bHRzIHRvIEd1ZXN0IGJlY2F1c2Ugd2UgYWxsb3cgR3Vlc3QgdG8g
Y291bnQgUE1VCmZpcm13YXJlIGV2ZW50cy4gUmVmZXIsIFsxXSBhbmQgWzJdIGZvciBwYXN0IGRp
c2N1c3Npb25zLgoKWzFdIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51
eC1yaXNjdi8yMDI0LUF1Z3VzdC8wNTk2NTguaHRtbApbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjQxMjI0LWt2bV9ndWVzdF9zdGF0LXYyLTAtMDhhNzdhYzM2YjAyQHJpdm9zaW5j
LmNvbS8KCkkgZG8gdW5kZXJzdGFuZCB0aGF0IGFkZGl0aW9uYWwgcmVkaXJlY3Rpb24gaG9vcCBj
YW4gc2xvdyBkb3duCmxhenkgZW5hYmxpbmcgb2YgdmVjdG9yIHN0YXRlIHNvIGRyb3AgZGVsZWdh
dGluZyB2YXJpb3VzIGFjY2VzcwpmYXVsdHMuCgpSZWdhcmRzLApBbnVwCgo+Cj4gU2lnbmVkLW9m
Zi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICA0ICsrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV9leGl0LmMgICAgICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmgKPiBpbmRleCA4NWNmZWJjMzJlNGNmLi5lMDQ4NTFjZjAxMTVjIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC00NCw3ICs0NCwxMSBAQAo+ICAjZGVmaW5lIEtW
TV9SRVFfU1RFQUxfVVBEQVRFICAgICAgICAgICBLVk1fQVJDSF9SRVEoNikKPgo+ICAjZGVmaW5l
IEtWTV9IRURFTEVHX0RFRkFVTFQgICAgICAgICAgICAoQklUKEVYQ19JTlNUX01JU0FMSUdORUQp
IHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKEVYQ19J
TlNUX0FDQ0VTUykgICAgIHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQklUKEVYQ19JTlNUX0lMTEVHQUwpICAgIHwgXAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQklUKEVYQ19CUkVBS1BPSU5UKSAgICAgIHwgXAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKEVYQ19MT0FEX0FDQ0VTUykg
ICAgIHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKEVY
Q19TVE9SRV9BQ0NFU1MpICAgIHwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQklUKEVYQ19TWVNDQUxMKSAgICAgICAgIHwgXAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQklUKEVYQ19JTlNUX1BBR0VfRkFVTFQpIHwgXAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKEVYQ19MT0FEX1BBR0Vf
RkFVTFQpIHwgXAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gaW5kZXggNmUwYzE4NDEyNzk1Ni4uNmUyMzAyYzY1
ZTE5MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gQEAgLTE5MywxMSArMTkzLDYgQEAgaW50IGt2bV9y
aXNjdl92Y3B1X2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVu
LAo+ICAgICAgICAgcmV0ID0gLUVGQVVMVDsKPiAgICAgICAgIHJ1bi0+ZXhpdF9yZWFzb24gPSBL
Vk1fRVhJVF9VTktOT1dOOwo+ICAgICAgICAgc3dpdGNoICh0cmFwLT5zY2F1c2UpIHsKPiAtICAg
ICAgIGNhc2UgRVhDX0lOU1RfSUxMRUdBTDoKPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3Zj
cHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19JTExFR0FMX0lOU04pOwo+IC0gICAgICAg
ICAgICAgICB2Y3B1LT5zdGF0Lmluc3RyX2lsbGVnYWxfZXhpdHMrKzsKPiAtICAgICAgICAgICAg
ICAgcmV0ID0gdmNwdV9yZWRpcmVjdCh2Y3B1LCB0cmFwKTsKPiAtICAgICAgICAgICAgICAgYnJl
YWs7Cj4gICAgICAgICBjYXNlIEVYQ19MT0FEX01JU0FMSUdORUQ6Cj4gICAgICAgICAgICAgICAg
IGt2bV9yaXNjdl92Y3B1X3BtdV9pbmNyX2Z3KHZjcHUsIFNCSV9QTVVfRldfTUlTQUxJR05FRF9M
T0FEKTsKPiAgICAgICAgICAgICAgICAgdmNwdS0+c3RhdC5sb2FkX21pc2FsaWduZWRfZXhpdHMr
KzsKPiBAQCAtMjA4LDE5ICsyMDMsNiBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfZXhpdChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAgICAgICAgICAgICAgIHZj
cHUtPnN0YXQuc3RvcmVfbWlzYWxpZ25lZF9leGl0cysrOwo+ICAgICAgICAgICAgICAgICByZXQg
PSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAt
ICAgICAgIGNhc2UgRVhDX0xPQURfQUNDRVNTOgo+IC0gICAgICAgICAgICAgICBrdm1fcmlzY3Zf
dmNwdV9wbXVfaW5jcl9mdyh2Y3B1LCBTQklfUE1VX0ZXX0FDQ0VTU19MT0FEKTsKPiAtICAgICAg
ICAgICAgICAgdmNwdS0+c3RhdC5sb2FkX2FjY2Vzc19leGl0cysrOwo+IC0gICAgICAgICAgICAg
ICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+IC0gICAgICAgICAgICAgICBicmVh
azsKPiAtICAgICAgIGNhc2UgRVhDX1NUT1JFX0FDQ0VTUzoKPiAtICAgICAgICAgICAgICAga3Zt
X3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19BQ0NFU1NfU1RPUkUpOwo+
IC0gICAgICAgICAgICAgICB2Y3B1LT5zdGF0LnN0b3JlX2FjY2Vzc19leGl0cysrOwo+IC0gICAg
ICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+IC0gICAgICAgICAg
ICAgICBicmVhazsKPiAtICAgICAgIGNhc2UgRVhDX0lOU1RfQUNDRVNTOgo+IC0gICAgICAgICAg
ICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+IC0gICAgICAgICAgICAgICBi
cmVhazsKPiAgICAgICAgIGNhc2UgRVhDX1ZJUlRVQUxfSU5TVF9GQVVMVDoKPiAgICAgICAgICAg
ICAgICAgaWYgKHZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dC5oc3RhdHVzICYgSFNUQVRVU19TUFYp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X3ZjcHVfdmlydHVhbF9p
bnNuKHZjcHUsIHJ1biwgdHJhcCk7Cj4gLS0KPiAyLjIwLjEKPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
