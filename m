Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D523BC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQRjp1b9cxmPHidnn97wbS8ec7y2XI6uC9Y3/44+xv0=; b=ozqeWM6b3S8kCz
	CE3Kpmnrc+YB/HnCBQ3pdzJYhQ8+fyTDGls0b4lBvEoIOFRd4KDJGjlgohn78wvZS5xW6D85Qju/P
	uhCDzmqy5jwsZ6M//mG07lHjJQYdPjdnqWML6657YK+1RDcYT92H7dcg0x2FBt/uOC6m1tcn5Lj3G
	wh1uZ32vFdVfaVdj7ZqNW9CY2TLU0aHUSN9ODvqiZ3iptu+jM5DVEj+OYE2ok6gSXiKe42haqV9xv
	b8esu8hDRVkxirlw+UVxY4tundZ4Gm1F6MMt3AtVMVT0IBHMyQDLIONNAUdBWYn0fOEsbT05Q9FZW
	wGgtxAIZjk4XhRbzn/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCzVd-00EfP6-78; Thu, 27 Jan 2022 07:47:57 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCzVZ-00EfNM-Jz
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 07:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643269658;
 bh=B6O+fbNXpuVx/JeWAT/s1SRi+S3qIN/7KTiOemSzClQ=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References;
 b=LSyk+VLUeHop98U+fGWPlkh8FHD6XxyQEnlMf+afuZVoG90g+pD+sudMryMFrndTH
 dlEcHIDS8EIGY0kKBbRkwu4aFKgLGbNFtWS9QDKkrzgbuU2Z6WP05ji7bkUWxIsjh3
 8OXbZhT6yudW7ixlUojotWCt6iVec/E4fdKSExk8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [127.0.0.1] ([88.152.144.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1psI-1nFBMQ1R6m-002EiE; Thu, 27
 Jan 2022 08:47:38 +0100
Date: Thu, 27 Jan 2022 08:47:35 +0100
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Sunil V L <sunilvl@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Abner Chang <abner.chang@hpe.com>,
 Jessica Clarke <jrtc27@jrtc27.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/1=5D_riscv/efi=5Fstub=3A_A?=
 =?US-ASCII?Q?dd_support_for_RISCV=5FEFI=5FBOOT=5FPROTOCOL?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220126110615.33371-2-sunilvl@ventanamicro.com>
References: <20220126110615.33371-1-sunilvl@ventanamicro.com>
 <20220126110615.33371-2-sunilvl@ventanamicro.com>
Message-ID: <667AE324-A8D2-41ED-B9DF-62750F3C2574@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:z73T+TjRtpbU/BjDJ+ZgfGzrDysqWANGnHJJ2QfyQymXFONDONt
 QsHYcTbfbjQMhbfcwAJ0zmgVGHUNEri9dgpf9fsB0UiFlR+OJX+M5h3c1+Svs71yiFKaUKb
 9tusTCA/b5/v1ksQ4nPmHycsW/wJeAS5rD1K+ypQ9IwubrW5E1KTex4k29a7lIXj8tlQHKb
 ujRJ0GsYWMYuJrqRNjBrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1KJIZ6Tb9vw=:sFqZ1jynooNFIrmQsVVFwg
 3jq1YfXVGDvELQil/m+D2Vxj5brTOTMofT/JuZBV1zURAFEz22IHS5SBmviTvZocKI1LcquP4
 mHJwLhkMR35+54ILXIBcSW4Z4A9SlaSsQ1TncuZ0MY6KfVVxxtkW2bzEM8jpxb7IVu4XHrWA2
 nfuxPHk3+83R7mlp2H2SQdHNHg9DX1Y4xg1P0wr/dXVsJvsfsIEgm/MihXx1R7YqPV+dFCrtS
 4N4l993AGjZN35wA11A+sS7hGVgmNuDI5IxDJjK6A9GeEoVxh03zCPliEEx6Ezun9Cj2kEpiL
 3++WL6VaMpUvhBO/saw3IRHQXQUHwSPvRnQ2VCMNcbYIQg9NDTtOzHi8HHE7uYfM4456jApP9
 xVhF5VzEafwLkQdC3X2WEuhJcELjayLTU0siv2t6rZ/bvmuQkQ++Y1A6lPHdSDFg7ukk2hXp3
 ztptc7j72gP38i74YEtDvBKUdkPMIFOkeUugDqNDn6sIdv987sDjxNkeYYCSSnJkUetRCektw
 dYqm7g+6dDPalucjYzeVre8k3NzeHk7ufHDLP7GfoVXzZGjTuegQBV2nu4HJtJ9OzjwF7DtOe
 dJ1SVeTMMs8gsLJjlm14j+W8QzH4Y/1JYXBU1hbujo1z0BXFmYmiM94D1yYxJnP/7RaLGzRys
 xdRCGcX3hgn6xyzdGOeF7dAORbBs6u8ABUWwpc2aRiZx4GkraHivFDYGCczqQFHGQ6iAwG6Jo
 7sYE0r7INcoi4IV3MwxprULnxjfRJpj23CncJeb+aa2d+vfNq0fSMrFbgA/cc8yU0kZlKveh5
 MLhHQHjintSks//uW61lGab9DF61SaR+fKpRkwtobH8W5D+DCyNtkhlNB09O5Mkt7FOZ/XN+m
 sprW5O8to1UE7+T0Ty6MW9qPr6Ku8Fiben9/cgzdUm82/r+g9m65WYwOSdxAUn63rzTsCyVQb
 L2lueE7oef3kO3rH72df0uiFA++szQh0o7ZK7uJtWVbCCnsdmXM/v6hs/1Se+ypczGSz1W50N
 eaHZ/OPsA3OrNaDa4M+d7J94AToafMtdDFWlEceAxzkDD1QLUX+5WIkFVb62twAwDyAWRil1q
 Co/eyePrKvv27Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_234754_034860_1EDC361C 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am 26. Januar 2022 12:06:15 MEZ schrieb Sunil V L <sunilvl@ventanamicro.com>:
>This patch adds the support for getting the boot hart ID in
>Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL.

It would be helpful to add a link to the spec in the commit message and maybe a comment that this protocol is needed for the ACPI use case.

>
>Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>---
> drivers/firmware/efi/libstub/efistub.h    | 15 ++++++++++++
> drivers/firmware/efi/libstub/riscv-stub.c | 28 ++++++++++++++++++++---
> include/linux/efi.h                       |  1 +
> 3 files changed, 41 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
>index edb77b0621ea..0428f8816942 100644
>--- a/drivers/firmware/efi/libstub/efistub.h
>+++ b/drivers/firmware/efi/libstub/efistub.h
>@@ -720,6 +720,21 @@ union efi_tcg2_protocol {
> 	} mixed_mode;
> };
> 
>+typedef union riscv_efi_boot_protocol riscv_efi_boot_protocol_t;
>+
>+union riscv_efi_boot_protocol {
>+	struct {
>+		u64 revision;
>+		efi_status_t (__efiapi *get_boot_hartid)(
>+							 riscv_efi_boot_protocol_t *,
>+							 size_t *);

I prefer to have parameter names for readability

According to the platform specification mhartid is MXLEN wide. UINTN (size_t) is SXLEN wide. 

Does this have any implications on how we define the protocol?

>+	};
>+	struct {
>+		u32 revision;
>+		u32 get_boot_hartid;>+	} mixed_mode;
>+};
>+
> typedef union efi_load_file_protocol efi_load_file_protocol_t;
> typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> 
>diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
>index 380e4e251399..c7add4eb5453 100644
>--- a/drivers/firmware/efi/libstub/riscv-stub.c
>+++ b/drivers/firmware/efi/libstub/riscv-stub.c
>@@ -46,12 +46,34 @@ static u32 get_boot_hartid_from_fdt(void)
> 	return fdt32_to_cpu(*prop);
> }
> 
>+static u32 get_boot_hartid_from_efi(void)
>+{

The returned value must be UINTN /size_t like the protocol. This width must be carried to the legacy entry point of Linux.

>+	efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
>+	efi_status_t status;
>+	riscv_efi_boot_protocol_t *boot_protocol;
>+	size_t boot_hart_id;
>+
>+	status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
>+			     (void **)&boot_protocol);
>+	if (status == EFI_SUCCESS) {
>+		status = efi_call_proto(boot_protocol,
>+					get_boot_hartid, &boot_hart_id);
>+		if (status == EFI_SUCCESS) {
>+			return (u32)boot_hart_id;
>+		}
>+	}
>+	return U32_MAX;

U32_MAX is a legal value for the hart id.

>+}
>+
> efi_status_t check_platform_features(void)
> {
>-	hartid = get_boot_hartid_from_fdt();
>+	hartid = get_boot_hartid_from_efi();
> 	if (hartid == U32_MAX) {
>-		efi_err("/chosen/boot-hartid missing or invalid!\n");
>-		return EFI_UNSUPPORTED;
>+		hartid = get_boot_hartid_from_fdt();
>+		if (hartid == U32_MAX) {

U32_MAX is a legal value for the hart id. Please, separate status and value.

Best regards

Heinrich

>+			efi_err("/chosen/boot-hartid missing or invalid!\n");
>+			return EFI_UNSUPPORTED;
>+		}
> 	}
> 	return EFI_SUCCESS;
> }
>diff --git a/include/linux/efi.h b/include/linux/efi.h
>index ccd4d3f91c98..9822c730207c 100644
>--- a/include/linux/efi.h
>+++ b/include/linux/efi.h
>@@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
> #define EFI_CONSOLE_OUT_DEVICE_GUID		EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
> #define APPLE_PROPERTIES_PROTOCOL_GUID		EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
> #define EFI_TCG2_PROTOCOL_GUID			EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
>+#define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
> #define EFI_LOAD_FILE_PROTOCOL_GUID		EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
> #define EFI_LOAD_FILE2_PROTOCOL_GUID		EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
> #define EFI_RT_PROPERTIES_TABLE_GUID		EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
